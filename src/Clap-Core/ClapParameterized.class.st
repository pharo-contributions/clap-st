"
I am an abstract class specifying a parameter with nested parameters.
"
Class {
	#name : #ClapParameterized,
	#superclass : #ClapParameter,
	#instVars : [
		'positionals'
	],
	#category : #'Clap-Core-Parameters'
}

{ #category : #'as yet unclassified' }
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
	super initialize.
	positionals := OrderedCollection new
]

{ #category : #matching }
ClapParameterized >> matchCanonicalName: aStream [

	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameterized >> matchPremiseOn: aStream [
	^ (self matchCanonicalName: aStream)
		ifTrue: [ self matchWord: aStream next]
		ifFalse: [ self mismatch ]
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

{ #category : #matching }
ClapParameterized >> with: partialMatch matchOn: aStream [
	| next |
	[ next := partialMatch unboundParameters. next isEmpty ]
		whileNotNil: [ | subMatch |
			subMatch := next first matchOn: aStream.
			subMatch ifMismatch: [ ^ partialMatch ].
			subMatch recordIn: partialMatch ].
	^ partialMatch
]
