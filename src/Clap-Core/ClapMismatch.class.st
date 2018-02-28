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

{ #category : #accessing }
ClapMismatch >> at: aSpec [
	^ ClapAbsentMatch specification: aSpec
]

{ #category : #testing }
ClapMismatch >> ifMismatch: aBlock [
	^ aBlock cull: self
]

{ #category : #testing }
ClapMismatch >> isExplicit [
	^ false
]

{ #category : #testing }
ClapMismatch >> isMismatch [
	^ true
]

{ #category : #adding }
ClapMismatch >> recordIn: parentMatch [ 
	"this match failed, so do nothing"
]
