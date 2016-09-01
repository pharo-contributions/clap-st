Class {
	#name : #ClapParameterTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'subject'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #testing }
ClapParameterTest class >> isAbstract [
	^ self == ClapParameterTest
]

{ #category : #accessing }
ClapParameterTest >> classToTest [
	^ self subclassResponsibility
]

{ #category : #running }
ClapParameterTest >> setUp [
	subject := self classToTest withName: 'foo'.
	argv := Mock named: 'argv'
]

{ #category : #tests }
ClapParameterTest >> testCanonicalName [
	subject canonicalName should equal: 'foo'
]

{ #category : #tests }
ClapParameterTest >> testMismatchesAtEnd [
	| match |
	argv stub atEnd willReturn: true.
	argv stub peek willReturn: nil.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: subject
]
