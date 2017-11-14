"
I represent a ClapMatcher subclass and I store in a stack all the positional parameters of a command according to which order you want it should be tested. When the method matchOn: is invoked, the element at the top of the stack will be tested and if its matched, its removed, else, it stays at the top. 
"
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
ClapQueue >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #accessing }
ClapQueue >> push: aParameter [ 
	stack push: aParameter
]
