"
I represent a positional parameter, i.e. that matches based on its position in the input instead of on a keyword.
"
Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapPositional >> accept: aVisitor [
	^ aVisitor visitPositional: self
]

{ #category : #evaluating }
ClapPositional >> basicMeaningOf: aMatch [
	^ aMatch isRecognized
		ifTrue: [ aMatch word ]
		ifFalse: [ self notYetImplemented ]
]

{ #category : #evaluating }
ClapPositional >> defaultMeaningOf: aMatch [
	^ defaultMeaningBlock
		ifNotNil: [ defaultMeaningBlock cull: aMatch ]
]

{ #category : #accessing }
ClapPositional >> matchClass [
	^ ClapPositionalMatch
]

{ #category : #matching }
ClapPositional >> matchOn: aStream [
	^ (aStream atEnd or: [aStream peek beginsWith: '-'])
		ifTrue: [ self mismatch ]
		ifFalse: [ self matchWord: aStream next ]
]

{ #category : #matching }
ClapPositional >> matchPremiseOn: aStream [
	^ (aStream atEnd or: [aStream peek beginsWith: '-'])
		ifTrue: [ self mismatch ]
		ifFalse: [ self matchWord: aStream next ]
]

{ #category : #matching }
ClapPositional >> with: premiseMatch matchOn: aStream [ 
	^ premiseMatch
]
