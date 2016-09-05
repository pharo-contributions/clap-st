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
		addFlag: (ClapFlag withName: 'shout');
		addPositional: (ClapPositional withName: 'who')

]

{ #category : #tests }
ClapHelloWorldTest >> testHello [
	| argv match |
	argv := #('hello') readStream.

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should not be includesKey: 'who'
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

{ #category : #tests }
ClapHelloWorldTest >> testShouting [
	| argv match |
	argv := #('hello' '--shout' 'world') readStream.

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]

{ #category : #tests }
ClapHelloWorldTest >> testShoutingAfterthought [
	| argv match |
	argv := #('hello' 'world' '-s') readStream.

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]
