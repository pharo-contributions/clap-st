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
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello' 'world' '--help');
		command.
	
	self assertCollection:  command command hasSameElements: #('hello').
	self assert: (command hasFlag: '--help').
	self assert: (command positional: #who) equals: 'world'.
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
	
	self assertCollection: command command hasSameElements: #('git' 'status').
]

{ #category : #tests }
ClapCommandTest >> testShouldThrowNotFoundWhenAskingForAMissingPositional [
	| command |
	context := ClapContext specification: ClapCommandLineExamples hello.
	command := context
		arguments: #('hello');
		command.
	
	self 
		should: [ command positional: #who ]
		raise: NotFound

]
