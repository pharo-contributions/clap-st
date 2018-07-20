Class {
	#name : #ClapSubExpression,
	#superclass : #ClapExpression,
	#instVars : [
		'parent'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #testing }
ClapSubExpression class >> isAbstract [
	^ self == ClapSubExpression
]

{ #category : #accessing }
ClapSubExpression >> context [
	^ parent context
]

{ #category : #testing }
ClapSubExpression >> ifMatch: matchBlock ifMismatch: mismatchBlock [
	^ matchBlock cull: self
]

{ #category : #testing }
ClapSubExpression >> isExplicit [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapSubExpression >> parent [
	^ parent
]

{ #category : #accessing }
ClapSubExpression >> parent: aMatch [
	parent := aMatch
]
