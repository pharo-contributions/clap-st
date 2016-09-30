Class {
	#name : #ClapQueue,
	#superclass : #ClapMatcher,
	#instVars : [
		'stack'
	],
	#category : 'Clap-Core-Support'
}

{ #category : #accessing }
ClapQueue >> addAll: parameters [
	stack addAll: parameters
]

{ #category : #initialization }
ClapQueue >> initialize [
	stack := Stack new
]

{ #category : #testing }
ClapQueue >> isEmpty [
	^ stack isEmpty
]

{ #category : #matching }
ClapQueue >> matchOn: aStream [
	| top arg |
	(self isEmpty or: [ aStream atEnd ])
		ifTrue: [ ^ self mismatch ].

	top := stack pop.
	arg := top matchOn: aStream.
	arg ifMismatch: [ stack push: top ].
	^ arg
]

{ #category : #matching }
ClapQueue >> matchesOn: aStream do: aBlock [
	| match |
	[
		match := self matchOn: aStream.
		match isMismatch
	] whileFalse: [ aBlock cull: match ]
]

{ #category : #matching }
ClapQueue >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #accessing }
ClapQueue >> push: aParameter [ 
	stack push: aParameter
]
