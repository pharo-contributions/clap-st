tests
testHelloMismatch
	| argv matches |
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'foo'.
	
	matches := (ClapCommand withName: 'hello')
		matchOn: argv.
	
	argv should not receive next.
	matches should be isMismatch