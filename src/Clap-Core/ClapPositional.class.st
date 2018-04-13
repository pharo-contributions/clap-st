"
I represent a positional parameter, i.e. that matches based on its position in the input instead of on a keyword.
"
Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : 'Clap-Core-Parameters'
}

{ #category : #evaluating }
ClapPositional class >> basicMeaning [
	^ [ :match |
		match isExplicit
			ifTrue: [ match word ]
			ifFalse: [ nil ] ]
]

{ #category : #doc }
ClapPositional >> accept: aVisitor [
	^ aVisitor visitPositional: self
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

{ #category : #documenting }
ClapPositional >> synopsisOn: aStream [
	^ aStream
			nextPut: $<;
			nextPutAll: self canonicalName;
			nextPut: $>
]

{ #category : #matching }
ClapPositional >> with: premiseMatch matchOn: aStream [ 
	^ premiseMatch
]
