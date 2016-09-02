Class {
	#name : #ClapAlternative,
	#superclass : #Object,
	#instVars : [
		'alternatives'
	],
	#category : 'Clap-Core'
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
	alternatives
		do: [ :each | | match |
			match := each matchOn: aStream.
			match isMismatch not ifTrue: [ ^ match ] ].
	^ self mismatch
]

{ #category : #matching }
ClapAlternative >> mismatch [
	^ ClapMismatch for: self
]
