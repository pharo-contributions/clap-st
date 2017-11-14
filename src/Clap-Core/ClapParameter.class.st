"
I am an abstract class that specifies a parameter that could be recognized in the input.
"
Class {
	#name : #ClapParameter,
	#superclass : #Object,
	#instVars : [
		'canonicalName',
		'meaningBlock',
		'description'
	],
	#category : 'Clap-Core-Parameters'
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

{ #category : #accessing }
ClapParameter >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapParameter >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #evaluating }
ClapParameter >> defaultMeaningOf: aMatch [
	^ aMatch
]

{ #category : #accessing }
ClapParameter >> description [
	^ description
]

{ #category : #setting }
ClapParameter >> description: aString [
	description := aString
]

{ #category : #doc }
ClapParameter >> doc [
	Stdio << self docName;<< '    ';<< self description;lf
]

{ #category : #doc }
ClapParameter >> docName [
	^ canonicalName 
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
		ifNil: [ self defaultMeaningOf: aMatch ]
		ifNotNil: [ meaningBlock cull: aMatch ]
]

{ #category : #matching }
ClapParameter >> mismatch [
	^ ClapMismatch specification: self
]
