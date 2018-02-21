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

{ #category : #testing }
ClapAbsentMatch >> isExplicit [
	^ false
]

{ #category : #initialization }
ClapAbsentMatch >> specification: anArgumentSpec [ 
	specification := anArgumentSpec
]

{ #category : #initialization }
ClapAbsentMatch >> value [
	^ specification defaultMeaningOf: self
]

{ #category : #accessing }
ClapAbsentMatch >> word [
	^ nil
]
