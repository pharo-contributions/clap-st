Class {
	#name : #ClapPositionalTest,
	#superclass : #TestCase,
	#instVars : [
		'argv'
	],
	#category : 'Clap-Tests'
}

{ #category : #running }
ClapPositionalTest >> setUp [
	argv := Mock named: 'argv'
]

{ #category : #tests }
ClapPositionalTest >> testMatch [
	| arg match |
	arg := ClapPositional withName: 'foo'.
	argv stub atEnd willReturn: false.
	argv stub next willReturn: 'bar'.
	
	match := arg matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: arg.
	match value should equal: 'bar'
]

{ #category : #tests }
ClapPositionalTest >> testMismatchAtEnd [
	| arg match |
	arg := ClapPositional withName: 'foo'.
	argv stub atEnd willReturn: true.
	
	match := arg matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: arg
]
