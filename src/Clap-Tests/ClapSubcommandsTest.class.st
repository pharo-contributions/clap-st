Class {
	#name : #ClapSubcommandsTest,
	#superclass : #TestCase,
	#instVars : [
		'clap'
	],
	#category : 'Clap-Tests-Integration'
}

{ #category : #running }
ClapSubcommandsTest >> setUp [
	clap := (ClapCommand withName: 'clap')
		addFlag: ((ClapFlag withName: 'directory')
			addPositional: (ClapPositional withName: 'DIR'));
		addSubcommand: ((ClapCommand withName: 'this')
			addFlag: (ClapFlag withName: 'slow'));
		addSubcommand: ((ClapCommand withName: 'that')
			addFlag: (ClapFlag withName: 'encore');
			addPositional: (ClapPositional withName: 'clappee'))
]

{ #category : #running }
ClapSubcommandsTest >> testRootPositionalBeforeSubcommand [
	<expectedFailure "missing interpreted value of flags">
	| argv match |
	argv := ReadStream on: #('clap' '--directory' 'foo/bar/baz' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match at: 'directory') value should equal: 'foo/bar/baz'.

]

{ #category : #running }
ClapSubcommandsTest >> testThis [
	| argv match |
	argv := ReadStream on: #('clap' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should not be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match at: 'this') should not be isMismatch.
	(match at: 'this') should not be includesKey: 'slow'
]

{ #category : #running }
ClapSubcommandsTest >> testWrongCommandMismatches [
	| argv match |
	argv := ReadStream on: #('foo' '-d' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch
]
