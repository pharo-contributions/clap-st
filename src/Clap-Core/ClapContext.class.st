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
		'commandCandidates',
		'arguments'
	],
	#category : #'Clap-Core-Support'
}

{ #category : #'instance creation' }
ClapContext class >> on: argumentStream [ 
	<deprecated: 'use #with:, pass arguments at command invocation time'>
	^ self new
		arguments: argumentStream readStream
]

{ #category : #'instance creation' }
ClapContext class >> with: commandCandidates [ 
	^ self new
		candidates: commandCandidates
]

{ #category : #running }
ClapContext >> activate [
	commandCandidates
		collect: [ :each | each matchPremiseOn: self ]
		thenDo: [ :premise |
			premise isMismatch
				ifFalse: [
					self evaluate: premise.
					^ self exitSuccess ] ].

	^ self noneMatched
]

{ #category : #accessing }
ClapContext >> arguments [
	^ arguments
]

{ #category : #accessing }
ClapContext >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #'testing - deprecated' }
ClapContext >> atEnd [
	^ self arguments atEnd
]

{ #category : #accessing }
ClapContext >> candidates: commandSpecifications [
	commandCandidates := commandSpecifications
]

{ #category : #accessing }
ClapContext >> documenter [
	^ ClapDocumenter on: (ClapDocumentationFormatter on: self stdout)
]

{ #category : #running }
ClapContext >> evaluate: premiseMatch [
	[ (premiseMatch concludeMatchOn: self) value ]
	on: Exit
	do: [ :exit | self handleExit: exit ]
]

{ #category : #running }
ClapContext >> exitSuccess [
	Exit signalSuccess
]

{ #category : #running }
ClapContext >> handleExit: exit [
	self notYetImplemented 
]

{ #category : #running }
ClapContext >> interpret: args [
	^ self
		arguments: args;
		activate
]

{ #category : #'accessing - deprecated' }
ClapContext >> next [
	^ self arguments next
]

{ #category : #running }
ClapContext >> noneMatched [
	self notYetImplemented 
]

{ #category : #'accessing - deprecated' }
ClapContext >> peek [
	^ self arguments peek
]

{ #category : #accessing }
ClapContext >> stderr [
	^ VTermOutputDriver stderr
]

{ #category : #accessing }
ClapContext >> stdin [
	^ Stdio stdin
]

{ #category : #accessing }
ClapContext >> stdout [
	^ VTermOutputDriver stdout
]
