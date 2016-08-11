tests
testHelloMismatch
	| hello argv matches |
	hello := ClapCommand withName: 'hello'.
	
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'foo'.
	
	matches := hello matchesOn: argv.
	
	argv should not receive next.
	matches should be isMismatch