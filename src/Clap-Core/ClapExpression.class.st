"
I represent the concrete manifestation of a formal parameter during a command activation.
"
Class {
	#name : #ClapExpression,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'instance creation' }
ClapExpression class >> specification: aParameter [ 
	^ self new
		specification: aParameter;
		yourself
]

{ #category : #accessing }
ClapExpression >> context [
	^ self subclassResponsibility
]

{ #category : #evaluating }
ClapExpression >> evaluateMeaning: arg [
	^ specification defaultMeaning
		cull: self cull: arg
]

{ #category : #testing }
ClapExpression >> ifMatch: aBlock [
	^ self
		ifMatch: aBlock
		ifMismatch: [ self ]
]

{ #category : #testing }
ClapExpression >> ifMatch: matchBlock ifMismatch: mismatchBlock [
	^ self subclassResponsibility
]

{ #category : #testing }
ClapExpression >> ifMismatch: aBlock [
	^ self
		ifMatch: [ self ]
		ifMismatch: aBlock
]

{ #category : #testing }
ClapExpression >> isMatch [
	^ self
		ifMatch: [ true ]
		ifMismatch: [ false ]
]

{ #category : #testing }
ClapExpression >> isMismatch [
	^ self
		ifMatch: [ false ]
		ifMismatch: [ true ]
]

{ #category : #testing }
ClapExpression >> isValid [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapExpression >> specification [
	^ specification
]

{ #category : #initialization }
ClapExpression >> specification: anArgumentSpec [ 
	specification := anArgumentSpec
]

{ #category : #evaluating }
ClapExpression >> value [
	^ self value: nil
]

{ #category : #evaluating }
ClapExpression >> value: arg [
	^ self evaluateMeaning: arg
]
