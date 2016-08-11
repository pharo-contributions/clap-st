Class {
	#name : #ClapPositional,
	#superclass : #Object,
	#instVars : [
		'canonicalName'
	],
	#category : 'Clap-Tests'
}

{ #category : #'as yet unclassified' }
ClapPositional class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #initialization }
ClapPositional >> canonicalName: aString [ 
	canonicalName := aString
]
