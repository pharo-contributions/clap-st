tests
testHelloDefault
	| argv matches |
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'hello'.
	argv stub next willReturn: 'hello'.
	argv stub atEnd willReturn: true.
	
	matches := (ClapCommand withName: 'hello')
		add: ((ClapPositional withName: 'who')
					default: 'someone');
		matchOn: argv.
	
	argv should receive next once.
	matches should not be isMismatch.
	matches alias should equal: 'hello'.
	(matches at: 'who') value should equal: 'someone'