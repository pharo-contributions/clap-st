Class {
	#name : #ClapContextTest,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #'Clap-Tests-Integration'
}

{ #category : #running }
ClapContextTest >> setUp [
	super setUp.
	context := ClapContext specification: ClapCommandLineExamples hello
]

{ #category : #tests }
ClapContextTest >> testCanGetCommandInstanceRelatedToLastSubcommand [

	| command |
	
	context := ClapContext specification: ClapCommandLineExamples git.
	command := context 
		arguments: #( 'git' 'add');
		match;
		validateAll;
		command.

	self assert: command class equals: ClapGitAddCommandExample.
]

{ #category : #tests }
ClapContextTest >> testCanGetCommandSpecWhenNoSubcommand [

	| command |
	
	command := context 
		arguments: #();
		match;
		command.

	self assert: command class equals: context specification commandClass.
]

{ #category : #tests }
ClapContextTest >> testShouldValidationBeKoWhenMismatched [
	| result |
	result := context
		arguments: #('hi' 'world');
		match.
	
	self assert: context isMismatch.
	self deny: context isValid.
	self assert: context leftovers notEmpty.
	self assert: result class equals: ClapMismatch.
]

{ #category : #tests }
ClapContextTest >> testShouldValidationBeOkWhenMatched [
	| result |
	result := context
		arguments: #('hello' 'world' '--help');
		match;
		command.
	
	self assert: context isMatch.
	self assert: context isValid.
	self assert: context leftovers isEmpty.
	self assert: result class equals: ClapCommandLineExamples.
]

{ #category : #tests }
ClapContextTest >> testShouldValidationFailWhenUnexpectedRootPositionalAfterSubcommand [
	context
		arguments: #('hello' 'world' '--directory' 'foo/bar/baz');
		match.
	
	self assert: context isMatch.
	self deny: context isValid.
	self
		assert: context leftovers
		equals: #('--directory' 'foo/bar/baz')
]

{ #category : #tests }
ClapContextTest >> testWrongFlagMatchingButInvalid [
	context
		arguments: #('hello' '--inexistent');
		match.
	
	self assert: context isMatch.
	self deny: context isValid.
	self
		assert: context leftovers
		equals: #('--inexistent')
]
