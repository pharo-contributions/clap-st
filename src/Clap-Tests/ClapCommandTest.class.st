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
ClapCommandTest >> testMatches [
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match alias should equal: 'foo'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSinglePositional [
	| match |
	subject add: (ClapPositional withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'valueforbar').
	argv stub next willReturnValueFrom: #('foo' 'valueforbar').
	
	match := subject matchOn: argv.
	
	argv should receive next twice.
	match should not be isMismatch.
	match alias should equal: 'foo'.
	match should be includesKey: 'bar'. "FIXME not sure about the dictionary protocol"
	(match at: 'bar') should equal: 'valueforbar'
]

{ #category : #tests }
ClapCommandTest >> testMismatchesAtEnd [
	| match |
	argv stub peek willReturn: nil.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]

{ #category : #tests }
ClapCommandTest >> testMismatchesDifferentAlias [
	| match |
	argv stub peek willReturn: 'fooNOT'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]
