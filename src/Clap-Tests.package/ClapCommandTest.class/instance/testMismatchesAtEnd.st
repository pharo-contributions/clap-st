tests
testMismatchesAtEnd
	| match |
	argv stub peek willReturn: nil.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch