tests
testMismatchAtEnd
	| match |
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: subject