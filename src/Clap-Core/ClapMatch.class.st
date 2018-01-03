"
I am an abstract class that represents the successful match of a parameter with part of the input.

I link back to my specification and store the word of input that starts the match.
"
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

{ #category : #printing }
ClapMatch >> printOn: aStream [
	| needsSeparator |
	super printOn: aStream.
	aStream nextPut: $(.
	needsSeparator := false.
	self wordsDo: [ :each |
		needsSeparator ifTrue: [ aStream space ].
		aStream nextPutAll: each.
		needsSeparator := true ].
	aStream nextPut: $)
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

{ #category : #enumerating }
ClapMatch >> wordsDo: aBlock [
	aBlock value: self word
]
