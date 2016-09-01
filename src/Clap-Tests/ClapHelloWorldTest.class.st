Class {
	#name : #ClapHelloWorldTest,
	#superclass : #TestCase,
	#instVars : [
		'hello'
	],
	#category : 'Clap-Tests-Integration'
}

{ #category : #running }
ClapHelloWorldTest >> setUp [
	hello := (ClapCommand withName: 'hello')
		add: (ClapFlag withName: 'shout');
		add: (ClapPositional withName: 'who')

]

{ #category : #tests }
ClapHelloWorldTest >> testHelloWorld [
	| argv match |
	argv := #('hello' 'world') readStream.
	
	match := hello matchOn: argv.
	
	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should be includesKey: 'who'.
	(match at: 'who') should equal: 'world'
]
