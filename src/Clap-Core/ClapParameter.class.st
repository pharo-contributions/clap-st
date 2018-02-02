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
		'defaultBlock',
		'defaultMeaningBlock'
	],
	#category : #'Clap-Core-Parameters'
}

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

{ #category : #evaluating }
ClapParameter >> basicMeaningOf: aMatch [
	^ aMatch
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
	description := ''
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
ClapParameter >> meaning: aBlock [
	meaningBlock := aBlock
]

{ #category : #evaluating }
ClapParameter >> meaningOf: aMatch [
	^ meaningBlock
		ifNil: [ self basicMeaningOf: aMatch ]
		ifNotNil: [ meaningBlock cull: aMatch ]
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

{ #category : #matching }
ClapParameter >> with: premiseMatch matchOn: aStream [ 
	^ self subclassResponsibility
]
