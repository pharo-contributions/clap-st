Class {
	#name : #ClapFlagMatch,
	#superclass : #ClapParameterizedMatch,
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapFlagMatch class >> of: aFlag with: usedAlias [ 
	^ self new
		specification: aFlag
		word: usedAlias
]

{ #category : #accessing }
ClapFlagMatch >> alias [
	^ word
]
