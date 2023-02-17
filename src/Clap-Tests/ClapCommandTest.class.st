Class {
	#name : #ClapCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'context'
	],
	#category : #'Clap-Tests-Integration'
}

{ #category : #tests }
ClapCommandTest >> testShouldArgumentsBeOkWhenMatched [
	| command |
	context := ClapCommandLineExamples hello activateWith: #('hello' 'world' '--help').
	command := context command.
	
	self assertCollection: command commandSpecIdentifiers hasSameElements: #('hello').
	self assert: (command hasFlag: 'help').
	self assertCollection: (command positional: #who) hasSameElements: #('world').
]

{ #category : #tests }
ClapCommandTest >> testShouldGetCollectionWhenAskingForAMultiplePositional [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello' 'foo' 'bar');
		command.
	
	self 
		assertCollection: (command positional: #who)
		hasSameElements: #('foo' 'bar') 

]

{ #category : #tests }
ClapCommandTest >> testShouldGetCollectionWhenAskingForAMultiplePositionalWithOneValue [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello' 'foo');
		command.
	
	self 
		assertCollection: (command positional: #who)
		hasSameElements: #('foo') 

]

{ #category : #tests }
ClapCommandTest >> testShouldGetDefaultValueWhenAskingForAMissingFlagWithPositionalWithDefaultValueSpecified [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello');
		command.
	
	self 
		assert: (command positional: #language)
		equals: #en

]

{ #category : #tests }
ClapCommandTest >> testShouldGetFlagPositionalValueWhenAskingForAFlagHavingPositional [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello' '--language' 'fr');
		command.
	
	self 
		assert: (command positional: #language)
		equals: #fr

]

{ #category : #tests }
ClapCommandTest >> testShouldReturnFalseWhenAskingForAMissingFlag [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello' 'world');
		command.
	
	self deny: (command hasFlag: '--help')
]

{ #category : #tests }
ClapCommandTest >> testShouldSubCommandsBeOkWhenMatched [
	| command |
	context := ClapContext specification: ClapCommandLineExamples git.
	command := context
		arguments: #('git' 'status');
		command.
	
	self 
		assertCollection: command commandSpecIdentifiers 
		hasSameElements: #('git' 'status').
]

{ #category : #tests }
ClapCommandTest >> testShouldThrowNotFoundWhenAskingForAMissingPositional [
	| spec command |
	
	spec := ClapCommandLineExamples hello.
	spec addFlagWithPositional: #foo description: 'some foo'.
	context := ClapContext specification: spec.
	command := context
		arguments: #('hello');
		command.
	
	self 
		should: [ command positional: #foo ]
		raise: NotFound

]
