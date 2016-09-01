Class {
	#name : #ClapMismatch,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : 'Clap-Core'
}

{ #category : #'instance creation' }
ClapMismatch class >> for: aCommand [ 
	^ self new specification: aCommand
]

{ #category : #adding }
ClapMismatch >> addTo: parentMatch [ 
	"this match failed, so do nothing"
]

{ #category : #testing }
ClapMismatch >> isMismatch [
	^ true
]

{ #category : #accessing }
ClapMismatch >> specification [
	^ specification
]

{ #category : #initialization }
ClapMismatch >> specification: anArgumentSpec [
	specification := anArgumentSpec
]
