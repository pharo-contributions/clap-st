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
		arguments: argumentStream
]

{ #category : #initialization }
ClapContext >> arguments: aStream [
	arguments := aStream
]

{ #category : #matching }
ClapContext >> defer: aParameter for: parentParameter [ 
	deferred push: aParameter -> parentParameter
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
	
	match addTo: top value.
	^ match
]

{ #category : #matching }
ClapContext >> mismatch [
	^ ClapMismatch specification: self
]
