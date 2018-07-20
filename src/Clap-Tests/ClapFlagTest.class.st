Class {
	#name : #ClapFlagTest,
	#superclass : #ClapParameterizedTest,
	#category : #'Clap-Tests-Unit'
}

{ #category : #accessing }
ClapFlagTest >> classToTest [
	^ ClapFlag
]

{ #category : #tests }
ClapFlagTest >> testMatchesLongForm [
	| match |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match word should equal: '--foo'
]

{ #category : #tests }
ClapFlagTest >> testMatchesShortForm [
	| match |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match word should equal: '-f'
]

{ #category : #tests }
ClapFlagTest >> testMismatchesWrongLongForm [
	| match |
	argv stub peek willReturn: '--fooNOT'.
	argv stub next willReturn: '--fooNOT'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: subject
]

{ #category : #tests }
ClapFlagTest >> testMismatchesWrongShortForm [
	| match |
	argv stub peek willReturn: '-F'.
	argv stub next willReturn: '-F'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: subject
]
