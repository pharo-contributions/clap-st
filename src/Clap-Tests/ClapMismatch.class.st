Class {
	#name : #ClapMismatch,
	#superclass : #Object,
	#instVars : [
		'specification'
	],
	#category : 'Clap-Tests-Scratch'
}

{ #category : #'instance creation' }
ClapMismatch class >> for: aCommand [ 
	^ self new specification: aCommand
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
