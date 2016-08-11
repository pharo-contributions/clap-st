Class {
	#name : #ClapMismatch,
	#superclass : #Object,
	#instVars : [
		'command'
	],
	#category : 'Clap-Tests'
}

{ #category : #'instance creation' }
ClapMismatch class >> for: aCommand [ 
	^ self new command: aCommand
]

{ #category : #initialization }
ClapMismatch >> command: aCommand [
	command := aCommand
]

{ #category : #testing }
ClapMismatch >> isMismatch [
	^ true
]
