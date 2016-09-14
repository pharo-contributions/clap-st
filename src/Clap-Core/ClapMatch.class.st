Class {
	#name : #ClapMatch,
	#superclass : #Object,
	#instVars : [
		'specification',
		'word'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #adding }
ClapMatch >> addTo: parentMatch [
	parentMatch
		at: specification canonicalName
		put: self
]

{ #category : #testing }
ClapMatch >> ifMismatch: aBlock [
	^ self
]

{ #category : #testing }
ClapMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapMatch >> specification [
	^ specification
]

{ #category : #initialization }
ClapMatch >> specification: anArgumentSpec [
	specification := anArgumentSpec
]

{ #category : #initialization }
ClapMatch >> specification: anArgumentSpec word: aString [ 
	specification := anArgumentSpec.
	word := aString
]
