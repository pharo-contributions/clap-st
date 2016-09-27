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
	argv := ClapContext on: #('hello').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should not be includesKey: 'who'
]

{ #category : #tests }
ClapHelloWorldTest >> testHelloWorld [
	| argv match |
	argv := ClapContext on: #('hello' 'world').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should be includesKey: 'who'.
	(match atName: 'who') word should equal: 'world'
]

{ #category : #tests }
ClapHelloWorldTest >> testShouting [
	| argv match |
	argv := ClapContext on: #('hello' '--shout').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should not be includesKey: 'who'
]

{ #category : #tests }
ClapHelloWorldTest >> testShoutingAfterthought [
	| argv match |
	argv := ClapContext on: #('hello' 'world' '-s').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]

{ #category : #tests }
ClapHelloWorldTest >> testShoutingWorld [
	| argv match |
	argv := ClapContext on: #('hello' '--shout' 'world').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]
