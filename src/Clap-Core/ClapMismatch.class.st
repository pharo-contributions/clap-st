Class {
	#name : #ClapMismatch,
	#superclass : #ClapMatch,
	#category : 'Clap-Core-Support'
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
ClapMismatch >> ifMismatch: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
ClapMismatch >> isMismatch [
	^ true
]
