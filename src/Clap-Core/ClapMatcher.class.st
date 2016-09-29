Class {
	#name : #ClapMatcher,
	#superclass : #Object,
	#category : 'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapMatcher class >> withAll: parameters [
	^ self new addAll: parameters
]
