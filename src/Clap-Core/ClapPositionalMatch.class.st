Class {
	#name : #ClapPositionalMatch,
	#superclass : #ClapMatch,
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapPositionalMatch class >> of: aPositional with: aString [ 
	^ self new
		specification: aPositional
		word: aString
]

{ #category : #accessing }
ClapPositionalMatch >> value [
	^ word
]
