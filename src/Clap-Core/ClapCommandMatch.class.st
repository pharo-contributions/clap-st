Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapParameterizedMatch,
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapCommandMatch class >> of: aCommand with: usedAlias [ 
	^ self new
		specification: aCommand
		word: usedAlias
]

{ #category : #accessing }
ClapCommandMatch >> alias [
	^ word
]
