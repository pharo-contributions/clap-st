Class {
	#name : #ClapCommandMatch,
	#superclass : #Object,
	#instVars : [
		'command',
		'alias',
		'arguments'
	],
	#category : 'Clap-Tests'
}

{ #category : #'instance creation' }
ClapCommandMatch class >> of: aCommand withAlias: usedAlias [ 
	^ self new
		command: aCommand
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

{ #category : #initialization }
ClapCommandMatch >> command: aCommand alias: aString [ 
	command := aCommand.
	alias := aString
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
