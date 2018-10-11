"
Tests around matching non-trivial commands and parameters.

In the absence of a parent context however, we can't test invalid or extra arguments; see ClapContextTest for this.
"
Class {
	#name : #ClapMatchesTest,
	#superclass : #TestCase,
	#instVars : [
		'clap',
		'dirFlag',
		'slowFlag'
	],
	#category : #'Clap-Tests-Integration'
}

{ #category : #running }
ClapMatchesTest >> setUp [
	dirFlag := (ClapFlag withName: 'directory')
		add: (ClapPositional withName: 'DIR').
	slowFlag := ClapFlag withName: 'slow'.
	
	clap := (ClapCommand withName: 'clap')
		add: dirFlag;
		add: ((ClapCommand withName: 'this')
			add: slowFlag);
		add: ((ClapCommand withName: 'that')
			add: (ClapFlag withName: 'encore');
			add: (ClapPositional withName: 'clappee'))
]

{ #category : #running }
ClapMatchesTest >> testFlagAbsentValue [
	| match flagMatch |
	slowFlag meaning: [ :flag | flag isMismatch not ].
	
	match := clap matchOn: #('clap' 'this') readStream.
	
	flagMatch := (match atName: 'this') at: slowFlag.
	flagMatch should not be isExplicit.
	flagMatch parent parent should be: match.
	flagMatch value should be: false.

]

{ #category : #running }
ClapMatchesTest >> testFlagOmittedValue [
	| match flagMatch |
	clap add: slowFlag. "we need another flag to follow the incomplete one"
	
	match := clap match: #('clap' '--directory' '--slow').
	
	flagMatch := match at: dirFlag.
	flagMatch should be isExplicit.
	flagMatch value should not be: '--slow'.
	(flagMatch atName: 'DIR') should not be isExplicit.
	(match at: slowFlag) should be isExplicit.

]

{ #category : #running }
ClapMatchesTest >> testFlagValue [
	| match flagMatch |
	slowFlag meaning: [ :flag | flag isMismatch not ].
	
	match := clap match: #('clap' 'this' '--slow').
	
	flagMatch := ((match atName: 'this') at: slowFlag).
	flagMatch should be isExplicit.
	flagMatch parent parent should be: match.
	flagMatch value should be: true.

]

{ #category : #running }
ClapMatchesTest >> testMultiplePositional [
	| match multi values |
	multi := (ClapPositional withName: 'list') multiple: true.
	clap add: multi.
	
	match := clap match: #('clap' 'foo' 'bar' 'baz' '-d' 'a/b/c').
	
	match should not be isMismatch.
	match should be includesMatchNamed: 'directory'.
	match should be includesMatchNamed: 'list'.
	match should be includesMatchOf: multi.
	
	(match occurrencesOf: multi) size should be: 3.
	(match occurrencesNamed: 'list' collect: #value) should equal: #('foo' 'bar' 'baz').
	((match atName: 'list') allOccurrencesCollect: #value) should equal: #('foo' 'bar' 'baz').
	
	values := 0.
	match occurrencesNamed: 'list' do: [ :each | values := values + 1 ].
	values should be: 3
]

{ #category : #running }
ClapMatchesTest >> testParameterizedFlagValue [
	| match |
	dirFlag meaning: [ :flag | Path from: (flag atName: 'DIR') value ].
	
	match := clap match: #('clap' '--directory' 'foo/bar/baz').
	
	(match at: dirFlag) value should equal: (Path * 'foo' / 'bar' / 'baz').

]

{ #category : #running }
ClapMatchesTest >> testRootPositionalBeforeSubcommand [
	| match |
	match := clap match: #('clap' '--directory' 'foo/bar/baz' 'this').
	
	match should not be isMismatch.
	match should be includesMatchNamed: 'directory'.
	match should be includesMatchNamed: 'this'.
	match should not be includesMatchNamed: 'that'.
	((match atName: 'directory') atName: 'DIR') value should equal: 'foo/bar/baz'.
	(match at: dirFlag) positionalValues should equal: #( 'foo/bar/baz' )

]

{ #category : #running }
ClapMatchesTest >> testSubcommandAccessing [
	| match found |
	match := clap match: #('clap' 'this').
	
	match should not be isMismatch.
	match should not be includesMatchNamed: 'directory'.
	match should be includesMatchNamed: 'this'.
	match should not be includesMatchNamed: 'that'.
	(match atName: 'this') should not be isMismatch.
	(match atName: 'this') should not be includesMatchNamed: 'slow'.
	
	self
		should: [ match atName: 'this' ifFound: [ Notification signal ] ]
		raise: Notification.
	self
		should: [ match atName: 'this' ifFound: [ Notification signal ] ifAbsent: [ self fail ] ]
		raise: Notification.
]

{ #category : #running }
ClapMatchesTest >> testWrongCommandMismatches [
	| match |
	match := clap match: #('foo' '-d' 'bar/baz/qux' 'this').
	
	match should be isMismatch.
	match word should equal: 'foo'
]
