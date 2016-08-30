tests
testMismatchesDifferentAlias
	| match |
	argv stub peek willReturn: 'fooNOT'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch