"
I am an abstract class that represents the successful match of a parameter with part of the input.

I link back to my specification and store the word of input that starts the match.
"
Class {
	#name : #ClapMatch,
	#superclass : #ClapExpression,
	#instVars : [
		'word',
		'parent'
	],
	#category : #'Clap-Core-Activation-Matches'
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
ClapMatch >> ifMatch: aBlock [
	^ self
		ifMatch: aBlock
		ifMismatch: [ self ]
]

{ #category : #testing }
ClapMatch >> ifMatch: matchBlock ifMismatch: mismatchBlock [
	^ matchBlock cull: self
]

{ #category : #testing }
ClapMatch >> ifMismatch: aBlock [
	^ self
		ifMatch: [ self ]
		ifMismatch: aBlock
]

{ #category : #testing }
ClapMatch >> isExplicit [
	^ true
]

{ #category : #testing }
ClapMatch >> isMatch [
	^ self
		ifMatch: [ true ]
		ifMismatch: [ false ]
]

{ #category : #testing }
ClapMatch >> isMismatch [
	^ self
		ifMatch: [ false ]
		ifMismatch: [ true ]
]

{ #category : #testing }
ClapMatch >> isValid [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapMatch >> parent [
	^ parent
]

{ #category : #printing }
ClapMatch >> printDetailsOn: aStream [
	| needsSeparator |
	needsSeparator := false.
	self wordsDo: [ :each |
		needsSeparator ifTrue: [ aStream space ].
		aStream nextPutAll: each.
		needsSeparator := true ]

]

{ #category : #printing }
ClapMatch >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self printDetailsOn: aStream.
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
