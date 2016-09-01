Class {
	#name : #ClapFlag,
	#superclass : #ClapParameter,
	#category : 'Clap-Core'
}

{ #category : #accessing }
ClapFlag >> longForm [
	^ '--' , self canonicalName
]

{ #category : #matching }
ClapFlag >> matchOn: aStream [
	| word |
	word := aStream peek.
	^ (word = self shortForm or: [ word = self longForm ])
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapFlag >> matchWithAlias: aString [ 
	^ ClapFlagMatch of: self withAlias: aString
]

{ #category : #accessing }
ClapFlag >> shortForm [
	^ '-' , self shortName
]

{ #category : #accessing }
ClapFlag >> shortName [
	^ self canonicalName copyFrom: 1 to: 1
]
