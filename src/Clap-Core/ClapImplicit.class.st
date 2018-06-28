Class {
	#name : #ClapImplicit,
	#superclass : #ClapExpression,
	#instVars : [
		'specification'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'instance creation' }
ClapImplicit class >> specification: aParameter [ 
	^ self new specification: aParameter
]

{ #category : #evaluating }
ClapImplicit >> evaluateMeaning: arg [
	^ specification defaultMeaning cull: self cull: arg
]

{ #category : #testing }
ClapImplicit >> isExplicit [
	^ false
]

{ #category : #accessing }
ClapImplicit >> specification [
	^ specification
]

{ #category : #initialization }
ClapImplicit >> specification: anArgumentSpec [ 
	specification := anArgumentSpec
]

{ #category : #evaluating }
ClapImplicit >> value [
	^ self value: nil
]

{ #category : #evaluating }
ClapImplicit >> value: arg [
	^ self evaluateMeaning: arg
]

{ #category : #accessing }
ClapImplicit >> word [
	^ nil
]
