Class {
	#name : #ClapAlternativeTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'okMatch',
		'mismatch',
		'flagOne',
		'flagTwo',
		'subject'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapAlternativeTest >> setUp [
	argv := Mock named: 'argv'.
	
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	
	mismatch := Mock named: 'nope'.
	mismatch stub isMismatch willReturn: true.
	
	flagOne := Mock named: 'one'.
	flagTwo := Mock named: 'two'.
	
	subject := ClapAlternative new
		add: flagOne;
		add: flagTwo

]

{ #category : #tests }
ClapAlternativeTest >> testMatchesIterationBoth [
	| block |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) twice
]

{ #category : #tests }
ClapAlternativeTest >> testMatchesIterationFirst [
	| block |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) once
]

{ #category : #tests }
ClapAlternativeTest >> testMatchesIterationNone [
	| block |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	block should not receive cull: okMatch
]

{ #category : #tests }
ClapAlternativeTest >> testMatchesIterationSecond [
	| block |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) once
]

{ #category : #tests }
ClapAlternativeTest >> testMatchingBoth [
	| match |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	
	match := subject matchOn: argv.
	
	match should not be isMismatch.
	match should be: okMatch
]

{ #category : #tests }
ClapAlternativeTest >> testMatchingFirst [
	| match |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	
	match := subject matchOn: argv.
	
	match should be: okMatch
]

{ #category : #tests }
ClapAlternativeTest >> testMatchingNone [
	| match |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	
	match := subject matchOn: argv.
	
	match should be isMismatch
]

{ #category : #tests }
ClapAlternativeTest >> testMatchingSecond [
	| match |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	
	match := subject matchOn: argv.
	
	match should be: okMatch
]
