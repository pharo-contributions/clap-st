Class {
	#name : #ClapAlternative,
	#superclass : #ClapMatcher,
	#instVars : [
		'alternatives'
	],
	#category : 'Clap-Core-Support'
}

{ #category : #adding }
ClapAlternative >> add: aParameter [
	alternatives add: aParameter
]

{ #category : #adding }
ClapAlternative >> addAll: parameters [
	alternatives addAll: parameters
]

{ #category : #initialization }
ClapAlternative >> initialize [
	alternatives := OrderedCollection new
]

{ #category : #matching }
ClapAlternative >> matchOn: aStream [ 
	alternatives do: [ :each |
		| match |
		match := each matchOn: aStream.
		match isMismatch
			ifFalse: [ ^ match ] ].
	^ self mismatch
]

{ #category : #matching }
ClapAlternative >> matchesOn: aStream do: aBlock [
	| match |
	[
		match := self matchOn: aStream.
		match isMismatch
	] whileFalse: [ aBlock cull: match ]
]

{ #category : #matching }
ClapAlternative >> mismatch [
	^ ClapMismatch specification: self
]
