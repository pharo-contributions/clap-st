"
I represent a class which represents a failed match.
"
Class {
	#name : #ClapMismatch,
	#superclass : #ClapMatch,
	#category : 'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapMismatch class >> of: aSpecification with: aWord [
	^ self new
		specification: aSpecification;
		word: aWord
]

{ #category : #'instance creation' }
ClapMismatch class >> specification: aParameter [ 
	^ self new specification: aParameter
]

{ #category : #accessing }
ClapMismatch >> at: aSpec [
	^ ClapAbsentMatch specification: aSpec
]

{ #category : #testing }
ClapMismatch >> ifMatch: matchingBlock ifMismatch: mismatchBlock [
	^ mismatchBlock cull: self
]

{ #category : #testing }
ClapMismatch >> isExplicit [
	^ false
]

{ #category : #printing }
ClapMismatch >> printDetailsOn: aStream [
	aStream
		nextPutAll: word;
		nextPutAll: ' ≠ ';
		print: specification
]

{ #category : #adding }
ClapMismatch >> recordIn: parentMatch [ 
	"this match failed, so do nothing"
]
