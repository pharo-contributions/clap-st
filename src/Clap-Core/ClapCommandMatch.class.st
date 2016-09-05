Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapMatch,
	#instVars : [
		'alias',
		'arguments'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapCommandMatch class >> of: aCommand withAlias: usedAlias [ 
	^ self new
		specification: aCommand
		alias: usedAlias
]

{ #category : #accessing }
ClapCommandMatch >> alias [
	^ alias
]

{ #category : #accessing }
ClapCommandMatch >> at: canonicalName [
	^ (arguments at: canonicalName) value
]

{ #category : #accessing }
ClapCommandMatch >> at: canonicalName put: aMatch [
	arguments
		at: canonicalName
		put: aMatch
]

{ #category : #testing }
ClapCommandMatch >> includesKey: canonicalName [
	^ arguments includesKey: canonicalName
]

{ #category : #initialization }
ClapCommandMatch >> initialize [
	arguments := Dictionary new
]

{ #category : #initialization }
ClapCommandMatch >> specification: aCommand alias: aString [ 
	specification := aCommand.
	alias := aString
]
