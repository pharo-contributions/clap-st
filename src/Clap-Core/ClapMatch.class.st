"
I am an abstract class that represents the successful match of a parameter with part of the input.

I link back to my specification and store the word of input that starts the match.
"
Class {
	#name : #ClapMatch,
	#superclass : #Object,
	#instVars : [
		'specification',
		'word',
		'parent'
	],
	#category : #'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapMatch class >> of: aSpecification with: aWord [
	^ self new
		specification: aSpecification;
		word: aWord
]

{ #category : #evaluating }
ClapMatch >> evaluateMeaning: arg [
	^ specification meaning cull: self cull: arg
]

{ #category : #testing }
ClapMatch >> ifMismatch: aBlock [
	^ self
]

{ #category : #testing }
ClapMatch >> isExplicit [
	^ true
]

{ #category : #testing }
ClapMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapMatch >> parent [
	^ parent
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
	parent := parentMatch.
	parent recordParameterMatch: self
]

{ #category : #accessing }
ClapMatch >> rootMatch [
	^ parent
		ifNil: [ self ]
		ifNotNil: [ parent root ]
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
	^ self value: nil
]

{ #category : #evaluating }
ClapMatch >> value: arg [
	^ self evaluateMeaning: arg
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
