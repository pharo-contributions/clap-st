tests
testLongFormMismatch
	| match |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	
	match := subject matchOn: argv.
	
	match should be isMismatch 