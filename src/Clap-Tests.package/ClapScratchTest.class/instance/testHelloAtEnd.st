tests
testHelloAtEnd
	| hello argv matches |
	hello := ClapCommand withName: 'hello'.
	
	argv := Mock named: 'argv'.
	argv stub peek willReturn: nil.
	
	matches := hello matchOn: argv.
	
	argv should not receive next.
	matches should be isMismatch