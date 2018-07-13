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
ClapMatchesTest >> testFlagAbsentValue [
	| match flagMatch |
	slowFlag meaning: [ :flag | flag isMismatch not ].
	
	match := clap match: #('clap' 'this').
	
	flagMatch := (match atName: 'this') at: slowFlag.
	flagMatch should not be isExplicit.
	flagMatch parent parent should be: match.
	flagMatch rootMatch should be: match.
	flagMatch value should be: false.

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
ClapMatchesTest >> testParameterizedFlagValue [
	| match |
	dirFlag meaning: [ :flag | Path from: (flag atName: 'DIR') value ].
	
	match := clap match: #('clap' '--directory' 'foo/bar/baz').
	
	(match at: dirFlag) value should equal: (Path * 'foo' / 'bar' / 'baz').

]

{ #category : #running }
ClapMatchesTest >> testRootPositionalAfterSubcommand [
	| match |
	match := clap match: #('clap' 'this' '--directory' 'foo/bar/baz').
	
	match should be isMatch.
	match should not be isValid.
	match matchedSubcommand leftovers should equal: #('--directory' 'foo/bar/baz')
]

{ #category : #running }
ClapMatchesTest >> testRootPositionalBeforeSubcommand [
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
ClapMatchesTest >> testThis [
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
ClapMatchesTest >> testWrongCommandMismatches [
	| match |
	match := clap match: #('foo' '-d' 'bar/baz/qux' 'this').
	
	match should be isMismatch.
	match word should equal: 'foo'
]

{ #category : #running }
ClapMatchesTest >> testWrongFlagMatchesButInvalid [
	| match |
	match := clap match: #('clap' '-f' 'bar/baz/qux' 'this').
	
	match should be isMatch.
	match should not be isValid
]
