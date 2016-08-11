Class {
	#name : #ClapCommandMatch,
	#superclass : #Object,
	#instVars : [
		'command',
		'alias'
	],
	#category : 'Clap-Tests'
}

{ #category : #'instance creation' }
ClapCommandMatch class >> of: aCommand withAlias: usedAlias [ 
	^ self new
		command: aCommand
		alias: usedAlias
]

{ #category : #'as yet unclassified' }
ClapCommandMatch >> alias [
	^ alias
]

{ #category : #initialization }
ClapCommandMatch >> command: aCommand alias: aString [ 
	command := aCommand.
	alias := aString
]

{ #category : #testing }
ClapCommandMatch >> isMismatch [
	^ false
]
