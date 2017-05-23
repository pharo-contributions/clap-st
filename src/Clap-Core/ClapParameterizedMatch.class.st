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
	^ arguments detect: [ :arg | arg specification = aSpec ]
]

{ #category : #accessing }
ClapParameterizedMatch >> atName: canonicalName [
	^ self at: (specification atName: canonicalName)
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
