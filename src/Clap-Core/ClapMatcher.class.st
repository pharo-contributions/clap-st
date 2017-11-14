"
I represent an abstract class which is an entry point for the matching algorithm.
"
Class {
	#name : #ClapMatcher,
	#superclass : #Object,
	#category : 'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapMatcher class >> withAll: parameters [
	^ self new addAll: parameters
]
