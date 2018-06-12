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
	| match |
	slowFlag meaning: [ :flag | flag isMismatch not ].
	
	match := clap match: #('clap' 'this' '--slow').
	
	((match atName: 'this') at: slowFlag) value should be: true.

]

{ #category : #running }
ClapSubcommandsTest >> testParameterizedFlagValue [
	| match |
	dirFlag meaning: [ :flag | Path from: (flag atName: 'DIR') value ].
	
	match := clap match: #('clap' '--directory' 'foo/bar/baz').
	
	(match at: dirFlag) value should equal: (Path * 'foo' / 'bar' / 'baz').

]

{ #category : #running }
ClapSubcommandsTest >> testRootPositionalAfterSubcommand [
	| match |
	match := clap match: #('clap' 'this' '--directory' 'foo/bar/baz').
	
	match should be isMatch.
	match should not be isValid
]

{ #category : #running }
ClapSubcommandsTest >> testRootPositionalBeforeSubcommand [
	| match |
	match := clap match: #('clap' '--directory' 'foo/bar/baz' 'this').
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	((match atName: 'directory') atName: 'DIR') value should equal: 'foo/bar/baz'.
	(match at: dirFlag) positionalValues should equal: #( 'foo/bar/baz' )

]

{ #category : #running }
ClapSubcommandsTest >> testThis [
	| match |
	match := clap match: #('clap' 'this').
	
	match should not be isMismatch.
	match should not be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match atName: 'this') should not be isMismatch.
	(match atName: 'this') should not be includesKey: 'slow'
]

{ #category : #running }
ClapSubcommandsTest >> testWrongCommandMismatches [
	| match |
	match := clap match: #('foo' '-d' 'bar/baz/qux' 'this').
	
	match should be isMismatch
]

{ #category : #running }
ClapSubcommandsTest >> testWrongFlagMatchesButInvalid [
	| match |
	match := clap match: #('clap' '-f' 'bar/baz/qux' 'this').
	
	match should be isMatch.
	match should not be isValid
]

{ #category : #running }
ClapSubcommandsTest >> testWrongFlagMismatches [
	| match |
	match := clap match: #('clap' '-f' 'bar/baz/qux' 'this').
	
	match should be isMatch.
	match should not be isValid
]
