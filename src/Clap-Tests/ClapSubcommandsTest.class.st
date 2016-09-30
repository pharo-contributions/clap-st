Class {
	#name : #ClapSubcommandsTest,
	#superclass : #TestCase,
	#instVars : [
		'clap',
		'dirFlag',
		'slowFlag'
	],
	#category : 'Clap-Tests-Integration'
}

{ #category : #running }
ClapSubcommandsTest >> setUp [
	dirFlag := (ClapFlag withName: 'directory')
		addPositional: (ClapPositional withName: 'DIR').
	slowFlag := ClapFlag withName: 'slow'.
	
	clap := (ClapCommand withName: 'clap')
		addFlag: dirFlag;
		addSubcommand: ((ClapCommand withName: 'this')
			addFlag: slowFlag);
		addSubcommand: ((ClapCommand withName: 'that')
			addFlag: (ClapFlag withName: 'encore');
			addPositional: (ClapPositional withName: 'clappee'))
]

{ #category : #running }
ClapSubcommandsTest >> testFlagValue [
	| argv match |
	slowFlag meaning: [ :flag | flag isMismatch not ].
	
	argv := ClapContext on: #('clap' 'this' '--slow').
	match := clap matchOn: argv.
	
	((match atName: 'this') at: slowFlag) value should be: true.

]

{ #category : #running }
ClapSubcommandsTest >> testParameterizedFlagValue [
	| argv match |
	dirFlag meaning: [ :flag | Path from: (flag atName: 'DIR') value ].
	
	argv := ClapContext on: #('clap' '--directory' 'foo/bar/baz').
	match := clap matchOn: argv.
	
	(match at: dirFlag) value should equal: (Path * 'foo' / 'bar' / 'baz').

]

{ #category : #running }
ClapSubcommandsTest >> testRootPositionalBeforeSubcommand [
	| argv match |
	argv := ClapContext on: #('clap' '--directory' 'foo/bar/baz' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	((match atName: 'directory') atName: 'DIR') value should equal: 'foo/bar/baz'.
	(match at: dirFlag) positionalValues should equal: #( 'foo/bar/baz' )

]

{ #category : #running }
ClapSubcommandsTest >> testRootPositionalfterSubcommand [
	| argv match |
	argv := ClapContext on: #('clap' 'this' '--directory' 'foo/bar/baz').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	((match atName: 'directory') atName: 'DIR') value should equal: 'foo/bar/baz'.
	(match at: dirFlag) positionalValues should equal: #( 'foo/bar/baz' )

]

{ #category : #running }
ClapSubcommandsTest >> testThis [
	| argv match |
	argv := ClapContext on: #('clap' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should not be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match atName: 'this') should not be isMismatch.
	(match atName: 'this') should not be includesKey: 'slow'
]

{ #category : #running }
ClapSubcommandsTest >> testWrongCommandMismatches [
	| argv match |
	argv := ClapContext on: #('foo' '-d' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch
]

{ #category : #running }
ClapSubcommandsTest >> testWrongFlagMismatches [
	<expectedFailure "matching stops before the flag and declares success">
	| argv match |
	argv := ClapContext on: #('clap' '-f' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch
]
