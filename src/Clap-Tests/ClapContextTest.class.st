Class {
	#name : #ClapContextTest,
	#superclass : #TestCase,
	#instVars : [
		'context',
		'hello'
	],
	#category : #'Clap-Tests-Integration'
}

{ #category : #running }
ClapContextTest >> setUp [
	context := ClapContext specification:( hello := ClapCommandLineExamples hello)
]

{ #category : #running }
ClapContextTest >> testMatch [
	context
		arguments: #('hello' 'world');
		match.
	
	context should be isMatch.
	context should be isValid.
	context leftovers should be isEmpty
]

{ #category : #running }
ClapContextTest >> testRootPositionalAfterSubcommand [
	context
		arguments: #('hello' 'world' '--directory' 'foo/bar/baz');
		match.
	
	context leftovers should equal: #('--directory' 'foo/bar/baz').
	context should be isMatch.
	context should not be isValid

]

{ #category : #running }
ClapContextTest >> testWrongFlagMatchingButInvalid [
	context
		arguments: #('hello' '--inexistent');
		match.
	
	context should be isMatch.
	context should not be isValid.
	context leftovers should equal: #('--inexistent')
]
