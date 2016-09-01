Class {
	#name : #ClapCommand,
	#superclass : #ClapParameter,
	#instVars : [
		'arguments'
	],
	#category : 'Clap-Core'
}

{ #category : #accessing }
ClapCommand >> add: arg [ 
	arguments add: arg
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
