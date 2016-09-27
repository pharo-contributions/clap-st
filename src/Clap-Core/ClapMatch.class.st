Class {
	#name : #ClapMatch,
	#superclass : #Object,
	#instVars : [
		'specification',
		'word'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapMatch class >> of: aSpecification with: aWord [
	^ self new
		specification: aSpecification;
		word: aWord
]

{ #category : #testing }
ClapMatch >> ifMismatch: aBlock [
	^ self
]

{ #category : #testing }
ClapMatch >> isMismatch [
	^ false
]

{ #category : #adding }
ClapMatch >> recordIn: parentMatch [
	parentMatch recordParameterMatch: self
]

{ #category : #accessing }
ClapMatch >> specification [
	^ specification
]

{ #category : #initialization }
ClapMatch >> specification: anArgumentSpec [
	specification := anArgumentSpec
]

{ #category : #evaluating }
ClapMatch >> value [
	^ specification meaningOf: self
]

{ #category : #accessing }
ClapMatch >> word [
	^ word
]

{ #category : #initialization }
ClapMatch >> word: aString [
	word := aString
]
