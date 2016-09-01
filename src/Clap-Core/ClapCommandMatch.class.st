Class {
	#name : #ClapCommandMatch,
	#superclass : #Object,
	#instVars : [
		'alias',
		'arguments',
		'specification'
	],
	#category : 'Clap-Core'
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

{ #category : #testing }
ClapCommandMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapCommandMatch >> specification [
	^ specification
]

{ #category : #initialization }
ClapCommandMatch >> specification: aCommand alias: aString [ 
	specification := aCommand.
	alias := aString
]
