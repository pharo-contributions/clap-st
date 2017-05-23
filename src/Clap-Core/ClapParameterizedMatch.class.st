"
I represent an abstract class for commands with parameters matching.
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
