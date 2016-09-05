tests
testMatches
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match alias should equal: 'foo'