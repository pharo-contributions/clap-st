"
I represent the successful match of a parameter that consumes several words of input, like a flag or a (sub)command with nested parameters.

I implement a dictionary-like protocol for accessing matches for each of my arguments, either by name or by specification.
"
Class {
	#name : #ClapParameterizedMatch,
	#superclass : #ClapMatch,
	#instVars : [
		'arguments'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #accessing }
ClapParameterizedMatch >> at: aSpec [
	^ self
		at: aSpec
		ifAbsent: [ ClapAbsentMatch specification: aSpec ]
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

{ #category : #testing }
ClapParameterizedMatch >> includesKey: canonicalName [
	^ arguments anySatisfy: [ :arg | arg specification canonicalName = canonicalName ]
]

{ #category : #initialization }
ClapParameterizedMatch >> initialize [
	arguments := OrderedCollection new
]

{ #category : #evaluating }
ClapParameterizedMatch >> positionalValues [
	^ specification positionals
		collect: [ :each | (self at: each) value ]
]

{ #category : #accessing }
ClapParameterizedMatch >> recordParameterMatch: aMatch [
	arguments add: aMatch
]

{ #category : #parsing }
ClapParameterizedMatch >> unboundParameters [
	^ self unboundPositionals
]

{ #category : #parsing }
ClapParameterizedMatch >> unboundParametersAmong: parameters [
	^ parameters
		select: [ :pos | arguments noneSatisfy: [ :arg | arg specification = pos ] ]
]

{ #category : #parsing }
ClapParameterizedMatch >> unboundParametersAmong: parameters do: aBlock [
	^ parameters do: [ :param |
		(arguments noneSatisfy: [ :arg | arg specification = param ])
			ifTrue: [ aBlock cull: param ] ]
]

{ #category : #parsing }
ClapParameterizedMatch >> unboundPositionals [
	^ self unboundParametersAmong: specification positionals
]

{ #category : #enumerating }
ClapParameterizedMatch >> wordsDo: aBlock [
	super wordsDo: aBlock.
	arguments do: [ :each | each wordsDo: aBlock ]
]
