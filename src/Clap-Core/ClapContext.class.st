"
I represent the (stateful) context in which command parsing happens.
Most importantly I own a stream over the sequence of arguments to parse.

For example, the command ""eval '1 + 2' "" is represented by this:
	ClapContext on: #('eval' '1 + 2')
"
Class {
	#name : #ClapContext,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#category : #'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapContext class >> on: argumentStream [ 
	^ self new
		arguments: argumentStream readStream
]

{ #category : #initialization }
ClapContext >> arguments: aStream [
	arguments := aStream
]

{ #category : #testing }
ClapContext >> atEnd [
	^ arguments atEnd
]

{ #category : #accessing }
ClapContext >> next [
	^ arguments next
]

{ #category : #accessing }
ClapContext >> peek [
	^ arguments peek
]
