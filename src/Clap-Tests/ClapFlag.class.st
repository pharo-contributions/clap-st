Class {
	#name : #ClapFlag,
	#superclass : #Object,
	#instVars : [
		'canonicalName'
	],
	#category : 'Clap-Tests-Scratch'
}

{ #category : #'instance creation' }
ClapFlag class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #accessing }
ClapFlag >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapFlag >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #matching }
ClapFlag >> matchOn: aStream [
	^ aStream peek = ('--' , self canonicalName)
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapFlag >> matchWithAlias: aString [ 
	^ ClapFlagMatch of: self withAlias: aString
]
