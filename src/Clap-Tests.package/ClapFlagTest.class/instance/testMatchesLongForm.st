tests
testMatchesLongForm
	| match |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match alias should equal: '--foo'