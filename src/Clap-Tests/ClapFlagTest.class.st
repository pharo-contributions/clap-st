Class {
	#name : #ClapFlagTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'subject'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapFlagTest >> setUp [
	subject := ClapFlag withName: 'foo'.
	argv := Mock named: 'argv'
]

{ #category : #tests }
ClapFlagTest >> testCanonicalName [
	subject canonicalName should equal: 'foo'
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
