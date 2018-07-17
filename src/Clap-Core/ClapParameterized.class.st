"
I am an abstract class specifying a parameter with nested positional parameters.
"
Class {
	#name : #ClapParameterized,
	#superclass : #ClapParameter,
	#instVars : [
		'positionals'
	],
	#category : #'Clap-Core-Specifications'
}

{ #category : #testing }
ClapParameterized class >> isAbstract [
	^ self == ClapParameterized
]

{ #category : #adding }
ClapParameterized >> add: aParameter [
	^ aParameter addTo: self
]

{ #category : #adding }
ClapParameterized >> addAll: parameters [
	parameters do: [ :each | each addTo: self ]
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
ClapParameterized >> matchCanonicalName: aString [

	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameterized >> matchPremiseOn: aStream [
	^ (self matchCanonicalName: aStream peek)
		ifTrue: [ self newMatchAt: aStream]
		ifFalse: [ self newMismatchAt: aStream ]
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

{ #category : #matching }
ClapParameterized >> with: partialMatch detect: parameters matchOn: aStream ifFound: foundBlock ifNone: noneBlock [
	partialMatch
		unboundParametersAmong: parameters
		do: [ :param | | sub |
			sub := param matchOn: aStream.
			sub isMismatch ifFalse: [ ^ foundBlock cull: sub ] ].
	^ noneBlock value
]

{ #category : #matching }
ClapParameterized >> with: partialMatch detectMatchOn: aStream ifFound: foundBlock ifNone: noneBlock [
	^ self
		with: partialMatch
		detect: positionals
		matchOn: aStream
		ifFound: foundBlock
		ifNone: noneBlock

]

{ #category : #matching }
ClapParameterized >> with: partialMatch matchOn: aStream [
	[ self
		with: partialMatch
		detectMatchOn: aStream
		ifFound: [ :arg | arg recordIn: partialMatch ]
		ifNone: [ ^ partialMatch ]
	] repeat
]
