"
I represent the successful match of a parameter that consumes several words of input, like a flag or a (sub)command with nested parameters.

I implement a dictionary-like protocol for accessing matches for each of my arguments, either by name or by specification.
"
Class {
	#name : #ClapParameterizedMatch,
	#superclass : #ClapExplicit,
	#instVars : [
		'arguments'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #accessing }
ClapParameterizedMatch >> at: aSpec [
	^ self
		at: aSpec
		ifAbsent: [ ClapImplicit of: aSpec in: self ]
]

{ #category : #accessing }
ClapParameterizedMatch >> at: aSpec ifAbsent: absentBlock [
	^ arguments
		detect: [ :arg | arg specification = aSpec ]
		ifNone: absentBlock
]

{ #category : #accessing }
ClapParameterizedMatch >> at: aSpec ifFound: foundBlock [
	^ arguments
		detect: [ :arg | arg specification = aSpec ]
		ifFound: foundBlock
]

{ #category : #accessing }
ClapParameterizedMatch >> at: aSpec ifFound: foundBlock ifAbsent: absentBlock [
	^ arguments
		detect: [ :arg | arg specification = aSpec ]
		ifFound: foundBlock
		ifNone: absentBlock
]

{ #category : #accessing }
ClapParameterizedMatch >> atName: canonicalName [
	^ self at: (specification atName: canonicalName)
]

{ #category : #accessing }
ClapParameterizedMatch >> atName: canonicalName ifFound: foundBlock [
	^ self
		at: (specification atName: canonicalName)
		ifFound: foundBlock

]

{ #category : #accessing }
ClapParameterizedMatch >> atName: canonicalName ifFound: foundBlock ifAbsent: absentBlock [
	^ self
		at: (specification atName: canonicalName)
		ifFound: foundBlock
		ifAbsent: absentBlock
]

{ #category : #matching }
ClapParameterizedMatch >> completeMatchOn: aStream [
	super completeMatchOn: aStream.
	self matchParametersOn: aStream

]

{ #category : #matching }
ClapParameterizedMatch >> detectMatchOn: aStream ifFound: foundBlock ifNone: noneBlock [
	self specification parametersDo: [ :param |
		(param canMatchExtending: self) ifTrue: [
			| sub |
			sub := param matchOn: aStream.
			sub isMismatch ifFalse: [ ^ foundBlock cull: sub ] ] ].
	^ noneBlock value
]

{ #category : #testing }
ClapParameterizedMatch >> includesKey: canonicalName [
	^ arguments anySatisfy: [ :arg | arg specification canonicalName = canonicalName ]
]

{ #category : #initialization }
ClapParameterizedMatch >> initialize [
	arguments := OrderedCollection new
]

{ #category : #testing }
ClapParameterizedMatch >> isValid [
	^ arguments allSatisfy: #isValid
]

{ #category : #matching }
ClapParameterizedMatch >> matchParametersOn: aStream [
	[ self
		detectMatchOn: aStream
		ifFound: [ :arg | arg recordIn: self ]
		ifNone: [ ^ self ]
	] repeat
]

{ #category : #accessing }
ClapParameterizedMatch >> occurrencesNamed: canonicalName [
	^ self occurrencesOf: (specification atName: canonicalName)
]

{ #category : #enumerating }
ClapParameterizedMatch >> occurrencesNamed: canonicalName collect: aBlock [
	^ self
		occurrencesOf: (specification atName: canonicalName)
		collect: aBlock
]

{ #category : #enumerating }
ClapParameterizedMatch >> occurrencesNamed: canonicalName do: aBlock [
	^ self
		occurrencesOf: (specification atName: canonicalName)
		do: aBlock
]

{ #category : #accessing }
ClapParameterizedMatch >> occurrencesOf: aSpec [
	^ arguments select: [ :arg | arg specification = aSpec ]
]

{ #category : #enumerating }
ClapParameterizedMatch >> occurrencesOf: aSpec collect: aBlock [
	^ arguments
		select: [ :arg | arg specification = aSpec ]
		thenCollect: aBlock
]

{ #category : #enumerating }
ClapParameterizedMatch >> occurrencesOf: aSpec do: aBlock [
	^ arguments
		select: [ :arg | arg specification = aSpec ]
		thenDo: aBlock
]

{ #category : #evaluating }
ClapParameterizedMatch >> positionalValues [
	^ specification positionals
		collect: [ :each | (self at: each) value ]
]

{ #category : #matching }
ClapParameterizedMatch >> recordParameterMatch: aMatch [
	arguments add: aMatch
]

{ #category : #enumerating }
ClapParameterizedMatch >> wordsDo: aBlock [
	super wordsDo: aBlock.
	arguments do: [ :each | each wordsDo: aBlock ]
]
