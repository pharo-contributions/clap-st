Class {
	#name : #ClapPositional,
	#superclass : #Object,
	#instVars : [
		'canonicalName'
	],
	#category : 'Clap-Tests'
}

{ #category : #'as yet unclassified' }
ClapPositional class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #accessing }
ClapPositional >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapPositional >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #matching }
ClapPositional >> matchOn: aStream [
	^ aStream atEnd
		ifTrue: [ self mismatch ]
		ifFalse: [ ClapPositionalMatch of: self value: aStream next ]
]
