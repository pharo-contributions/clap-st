Class {
	#name : #ClapFlag,
	#superclass : #ClapParameterized,
	#category : 'Clap-Core-Parameters'
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
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			self matchOn: aStream positionalsFor: match.
			^ match ]
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
