Class {
	#name : #ClapCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'subject'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapCommandTest >> setUp [
	subject := ClapCommand withName: 'foo'.
	argv := Mock named: 'argv'
]

{ #category : #tests }
ClapCommandTest >> testCanonicalName [
	subject canonicalName should equal: 'foo'
]

{ #category : #tests }
ClapCommandTest >> testMatch [
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match alias should equal: 'foo'
]
