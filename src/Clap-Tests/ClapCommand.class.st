Class {
	#name : #ClapCommand,
	#superclass : #Object,
	#instVars : [
		'name',
		'arguments'
	],
	#category : 'Clap-Tests'
}

{ #category : #'instance creation' }
ClapCommand class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #'as yet unclassified' }
ClapCommand >> add: arg [ 
	arguments add: arg
]

{ #category : #accessing }
ClapCommand >> canonicalName [
	^ name
]

{ #category : #accessing }
ClapCommand >> canonicalName: aString [ 
	name := aString
]

{ #category : #initialization }
ClapCommand >> initialize [
	arguments := OrderedCollection new
]

{ #category : #matching }
ClapCommand >> matchWithAlias: aString [ 
	^ ClapCommandMatch of: self withAlias: aString
]

{ #category : #matching }
ClapCommand >> matchesOn: aStream [
	^ aStream peek = self canonicalName
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapCommand >> mismatch [
	^ ClapMismatch for: self
]
