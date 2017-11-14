"
I am an abstract class that specifies a parameter that could be recognized in the input.
"
Class {
	#name : #ClapParameter,
	#superclass : #Object,
	#instVars : [
		'canonicalName',
		'meaningBlock'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #'instance creation' }
ClapParameter class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
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

{ #category : #doc }
ClapParameter >> description [
	^ self subclassResponsibility 
]

{ #category : #doc }
ClapParameter >> doc [
	^ self subclassResponsibility 
	
]

{ #category : #doc }
ClapParameter >> docName [
	^ canonicalName 
]

{ #category : #accessing }
ClapParameter >> isCommand [
	^ false
]

{ #category : #accessing }
ClapParameter >> isFlag [
	^ false
]

{ #category : #accessing }
ClapParameter >> isPositional [
	^ false
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
