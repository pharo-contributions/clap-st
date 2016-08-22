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

{ #category : #accessing }
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
ClapCommand >> matchOn: aStream [
	^ aStream peek = self canonicalName
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			arguments do: [ :each | (each matchOn: aStream) addTo: match ].
			match ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapCommand >> matchWithAlias: aString [ 
	^ ClapCommandMatch of: self withAlias: aString
]

{ #category : #matching }
ClapCommand >> mismatch [
	^ ClapMismatch for: self
]
