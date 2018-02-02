"
I represent a class which represents a failed match.
"
Class {
	#name : #ClapMismatch,
	#superclass : #ClapMatch,
	#category : 'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapMismatch class >> specification: aParameter [ 
	^ self new specification: aParameter
]

{ #category : #testing }
ClapMismatch >> ifMismatch: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
ClapMismatch >> isMismatch [
	^ true
]

{ #category : #testing }
ClapMismatch >> isRecognized [
	^ false
]

{ #category : #adding }
ClapMismatch >> recordIn: parentMatch [ 
	"this match failed, so do nothing"
]
