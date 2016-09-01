Class {
	#name : #ClapParameter,
	#superclass : #Object,
	#instVars : [
		'canonicalName'
	],
	#category : 'Clap-Core'
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

{ #category : #matching }
ClapParameter >> matchOn: aStream [ 
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> mismatch [
	^ ClapMismatch for: self
]
