tests
testHello
	| hello argv matches |
	hello := ClapCommand withName: 'hello'.
	hello canonicalName should equal: 'hello'.
	
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'hello'.
	argv stub next willReturn: 'hello'.
	
	matches := hello matchOn: argv.
	
	argv should receive next.
	matches should not be isMismatch.
	matches alias should equal: 'hello'