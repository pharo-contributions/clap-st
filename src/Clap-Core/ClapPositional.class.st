Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : 'Clap-Core-Parameters'
}

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
