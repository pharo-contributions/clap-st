"
I represent a class which represent a positional which is accepted in a command.
"
Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : 'Clap-Core-Parameters'
}

{ #category : #evaluating }
ClapPositional >> defaultMeaningOf: aMatch [
	^ aMatch word
]

{ #category : #accessing }
ClapPositional >> matchClass [
	^ ClapPositionalMatch
]

{ #category : #matching }
ClapPositional >> matchOn: aStream [
	^ aStream atEnd
		ifTrue: [ self mismatch ]
		ifFalse: [ self matchWord: aStream next ]
]
