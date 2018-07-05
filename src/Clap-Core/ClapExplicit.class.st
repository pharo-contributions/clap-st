"
I am an abstract class that represents the successful match of a parameter with part of the input.

I link back to my specification and store the word of input that starts the match.
"
Class {
	#name : #ClapExplicit,
	#superclass : #ClapImplicit,
	#instVars : [
		'word'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'instance creation' }
ClapExplicit class >> of: aSpecification with: aWord [
	^ (self specification: aSpecification)
		word: aWord;
		yourself
]

{ #category : #evaluating }
ClapExplicit >> evaluateMeaning: arg [
	^ specification meaning cull: self cull: arg
]

{ #category : #testing }
ClapExplicit >> ifMatch: aBlock [
	^ self
		ifMatch: aBlock
		ifMismatch: [ self ]
]

{ #category : #testing }
ClapExplicit >> ifMatch: matchBlock ifMismatch: mismatchBlock [
	^ matchBlock cull: self
]

{ #category : #testing }
ClapExplicit >> ifMismatch: aBlock [
	^ self
		ifMatch: [ self ]
		ifMismatch: aBlock
]

{ #category : #testing }
ClapExplicit >> isExplicit [
	^ true
]

{ #category : #testing }
ClapExplicit >> isMatch [
	^ self
		ifMatch: [ true ]
		ifMismatch: [ false ]
]

{ #category : #testing }
ClapExplicit >> isMismatch [
	^ self
		ifMatch: [ false ]
		ifMismatch: [ true ]
]

{ #category : #testing }
ClapExplicit >> isValid [
	^ self subclassResponsibility
]

{ #category : #printing }
ClapExplicit >> printDetailsOn: aStream [
	| needsSeparator |
	needsSeparator := false.
	self wordsDo: [ :each |
		needsSeparator ifTrue: [ aStream space ].
		aStream nextPutAll: each.
		needsSeparator := true ]

]

{ #category : #printing }
ClapExplicit >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self printDetailsOn: aStream.
	aStream nextPut: $)
]

{ #category : #adding }
ClapExplicit >> recordIn: parentMatch [
	self parent: parentMatch.
	self parent recordParameterMatch: self
]

{ #category : #testing }
ClapExplicit >> validate [
	^ self
]

{ #category : #evaluating }
ClapExplicit >> value [
	^ self value: nil
]

{ #category : #evaluating }
ClapExplicit >> value: arg [
	^ self evaluateMeaning: arg
]

{ #category : #accessing }
ClapExplicit >> word [
	^ word
]

{ #category : #initialization }
ClapExplicit >> word: aString [
	word := aString
]

{ #category : #enumerating }
ClapExplicit >> wordsDo: aBlock [
	aBlock value: self word
]
