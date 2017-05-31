tests
testShortFormMismatch
	| match |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	
	match := subject matchOn: argv.
	
	match should be isMismatch.
	 