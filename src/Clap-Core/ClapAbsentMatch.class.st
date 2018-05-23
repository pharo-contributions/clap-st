Class {
	#name : #ClapAbsentMatch,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : #'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapAbsentMatch class >> specification: aParameter [ 
	^ self new specification: aParameter
]

{ #category : #evaluating }
ClapAbsentMatch >> evaluateMeaning: arg [
	^ specification defaultMeaning cull: self cull: arg
]

{ #category : #testing }
ClapAbsentMatch >> isExplicit [
	^ false
]

{ #category : #initialization }
ClapAbsentMatch >> specification: anArgumentSpec [ 
	specification := anArgumentSpec
]

{ #category : #evaluating }
ClapAbsentMatch >> value [
	^ self value: nil
]

{ #category : #evaluating }
ClapAbsentMatch >> value: arg [
	^ self evaluateMeaning: arg
]

{ #category : #accessing }
ClapAbsentMatch >> word [
	^ nil
]
