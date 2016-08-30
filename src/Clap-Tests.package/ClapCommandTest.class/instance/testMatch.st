tests
testMatch
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match alias should equal: 'foo'