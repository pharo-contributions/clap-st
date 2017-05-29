"
I represent the (stateful) context in which command parsing happens.
Most importantly I own a stream over the sequence of arguments to parse.

For example, the command ""eval '1 + 2' "" is represented by this:
	ClapContext on: #('eval' '1 + 2')
"
Class {
	#name : #ClapContext,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'deferred'
	],
	#category : 'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapContext class >> on: argumentStream [ 
	^ self new
		arguments: argumentStream readStream
]

{ #category : #initialization }
ClapContext >> arguments: aStream [
	arguments := aStream
]

{ #category : #testing }
ClapContext >> atEnd [
	^ arguments atEnd
]

{ #category : #matching }
ClapContext >> defer: aParameter for: parentMatch [ 
	deferred push: aParameter -> parentMatch
]

{ #category : #initialization }
ClapContext >> initialize [
	deferred := Stack new
]

{ #category : #matching }
ClapContext >> matchDeferred [
	| top match |
	deferred ifEmpty: [ ^ self mismatch ].
	
	top := deferred pop.
	match := top key matchOn: arguments.
	match ifMismatch: [
		deferred push: top.
		self mismatch ].
	
	match recordIn: top value.
	^ match
]

{ #category : #matching }
ClapContext >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #accessing }
ClapContext >> next [
	^ arguments next
]

{ #category : #accessing }
ClapContext >> peek [
	^ arguments peek
]
