Class {
	#name : #ClapFlagTest,
	#superclass : #ClapParameterTest,
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapFlagTest >> classToTest [
	^ ClapFlag
]

{ #category : #tests }
ClapFlagTest >> testMatchesLongForm [
	| match |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match alias should equal: '--foo'
]

{ #category : #tests }
ClapFlagTest >> testMatchesShortForm [
	| match |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match alias should equal: '-f'
]
