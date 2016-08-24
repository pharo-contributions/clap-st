tests
testMismatchAtEnd
	| arg match |
	arg := ClapPositional withName: 'foo'.
	argv stub atEnd willReturn: true.
	
	match := arg matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch.
	match specification should be: arg