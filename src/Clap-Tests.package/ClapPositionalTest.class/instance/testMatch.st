tests
testMatch
	| arg match |
	arg := ClapPositional withName: 'foo'.
	argv stub atEnd willReturn: false.
	argv stub next willReturn: 'bar'.
	
	match := arg matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: arg.
	match value should equal: 'bar'