Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapParameterizedMatch,
	#instVars : [
		'alias'
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

{ #category : #initialization }
ClapCommandMatch >> specification: aCommand alias: aString [ 
	specification := aCommand.
	alias := aString
]
