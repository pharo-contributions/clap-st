"
I am an abstract class specifying a parameter with nested parameters.
"
Class {
	#name : #ClapParameterized,
	#superclass : #ClapParameter,
	#instVars : [
		'positionals',
		'match'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #testing }
ClapParameterized class >> isAbstract [
	^ self == ClapParameterized
]

{ #category : #adding }
ClapParameterized >> addPositional: aPositional [
	positionals add: aPositional
]

{ #category : #accessing }
ClapParameterized >> atName: specName [
	^ self
		positionalNamed: specName
		ifNone: [ nil ]
]

{ #category : #initialization }
ClapParameterized >> initialize [
	positionals := OrderedCollection new
]

{ #category : #matching }
ClapParameterized >> matchCanonicalName: aStream [

	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameterized >> matchOn: aStream [
	| args |
	(self matchCanonicalName: aStream) ifTrue: [ match := self matchWord: aStream next] ifFalse: [ ^ self mismatch ].
	args := self parameters.
	[ aStream atEnd ]
		whileFalse: [ | subMatch |
			subMatch := args matchOn: aStream.
			subMatch isMismatch
				ifTrue: [ ^ self stopMatching ].
			subMatch recordIn: match ].
	^ match
]

{ #category : #accessing }
ClapParameterized >> parameters [
	^ self subclassResponsibility 
]

{ #category : #accessing }
ClapParameterized >> positionalNamed: specName ifNone: aBlock [
	^ positionals
		detect: [ :arg | arg canonicalName = specName ]
		ifNone: aBlock
]

{ #category : #accessing }
ClapParameterized >> positionals [
	^ positionals
]

{ #category : #private }
ClapParameterized >> stopMatching [
	^ self subclassResponsibility 
]
