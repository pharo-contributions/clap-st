Class {
	#name : #ClapPharoCommandsTest,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #'Clap-Tests-Commands'
}

{ #category : #testing }
ClapPharoCommandsTest class >> isAbstract [
	^ self = ClapPharoCommandsTest
]

{ #category : #asserting }
ClapPharoCommandsTest >> assertSuccess [
	self assert: context exit status equals: 0
]

{ #category : #accessing }
ClapPharoCommandsTest >> outputString [
	^ context stdio stdout contents utf8Decoded
]
