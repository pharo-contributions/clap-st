Class {
	#name : #ClapQueue,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : 'Clap-Tests-Scratch'
}

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
	^ ClapMismatch for: self
]

{ #category : #accessing }
ClapQueue >> push: aParameter [ 
	stack push: aParameter
]