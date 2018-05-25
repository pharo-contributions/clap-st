"
I am an abstract class that specifies a parameter that could be recognized in the input.
"
Class {
	#name : #ClapParameter,
	#superclass : #Object,
	#instVars : [
		'canonicalName',
		'description',
		'meaningBlock',
		'defaultMeaningBlock'
	],
	#category : #'Clap-Core-Specifications'
}

{ #category : #evaluating }
ClapParameter class >> basicMeaning [
	^ [ :match | match ]
]

{ #category : #'instance creation' }
ClapParameter class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #doc }
ClapParameter >> accept: aVisitor [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapParameter >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapParameter >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #initialization }
ClapParameter >> defaultMeaning [
	^ defaultMeaningBlock
]

{ #category : #initialization }
ClapParameter >> defaultMeaning: aBlock [
	defaultMeaningBlock := aBlock
]

{ #category : #accessing }
ClapParameter >> description [
	^ description
]

{ #category : #setting }
ClapParameter >> description: aString [
	description := aString
]

{ #category : #initialization }
ClapParameter >> initialize [
	description := ''.
	meaningBlock := self class basicMeaning.
	defaultMeaningBlock := meaningBlock
]

{ #category : #accessing }
ClapParameter >> matchClass [
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> matchOn: aStream [ 
	| premise |
	premise := self matchPremiseOn: aStream.
	premise isMismatch ifTrue: [ ^ premise ].
	
	^ self with: premise matchOn: aStream
]

{ #category : #matching }
ClapParameter >> matchPremiseOn: aStream [ 
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> matchWord: aString [
	^ self matchClass
		of: self
		with: aString
]

{ #category : #initialization }
ClapParameter >> meaning [
	^ meaningBlock
]

{ #category : #initialization }
ClapParameter >> meaning: aBlock [
	meaningBlock := aBlock
]

{ #category : #matching }
ClapParameter >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #printing }
ClapParameter >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self canonicalName;
		nextPut: $)
]

{ #category : #documenting }
ClapParameter >> synopsis [
	^ String streamContents: [ :aStream | self synopsisOn: aStream ]
]

{ #category : #documenting }
ClapParameter >> synopsisOn: aStream [
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> with: premiseMatch matchOn: aStream [ 
	^ self subclassResponsibility
]
