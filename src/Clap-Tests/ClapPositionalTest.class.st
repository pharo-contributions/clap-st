Class {
	#name : #ClapPositionalTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'subject'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapPositionalTest >> setUp [
	subject := ClapPositional withName: 'foo'.
	argv := Mock named: 'argv'

]

{ #category : #tests }
ClapPositionalTest >> testCanonicalName [
	subject canonicalName should equal: 'foo'
]

{ #category : #tests }
ClapPositionalTest >> testMatch [
	| match |
	argv stub atEnd willReturn: false.
	argv stub next willReturn: 'bar'.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match value should equal: 'bar'
]

{ #category : #tests }
ClapPositionalTest >> testMismatchAtEnd [
	| match |
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: subject
]
