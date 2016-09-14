Class {
	#name : #ClapQueue,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : 'Clap-Core-Support'
}

{ #category : #accessing }
ClapQueue >> add: aParameter [ 
	stack addLast: aParameter
]

{ #category : #enumerating }
ClapQueue >> do: aBlockClosure [ 
	self shouldBeImplemented.
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
ClapQueue >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #accessing }
ClapQueue >> push: aParameter [ 
	stack push: aParameter
]
