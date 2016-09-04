Class {
	#name : #ClapAlternative,
	#superclass : #Object,
	#instVars : [
		'alternatives'
	],
	#category : 'Clap-Core-Support'
}

{ #category : #adding }
ClapAlternative >> add: aParameter [
	alternatives add: aParameter
]

{ #category : #initialization }
ClapAlternative >> initialize [
	alternatives := OrderedCollection new
]

{ #category : #matching }
ClapAlternative >> matchOn: aStream [ 
	self
		matchesOn: aStream
		do: [ :match | ^ match ].
	^ self mismatch
]

{ #category : #matching }
ClapAlternative >> matchesOn: aStream do: aBlock [ 
	alternatives do: [ :each |
		| match |
		match := each matchOn: aStream.
		match isMismatch
			ifFalse: [ aBlock cull: match ] ]
]

{ #category : #matching }
ClapAlternative >> mismatch [
	^ ClapMismatch for: self
]
