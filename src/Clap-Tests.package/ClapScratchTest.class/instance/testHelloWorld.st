tests
testHelloWorld
	| matches argv |
	argv := Mock named: 'argv'.
	argv stub peek willReturnValueFrom: #('hello' 'world').
	argv stub next willReturnValueFrom: #('hello' 'world').
		
	matches := (ClapCommand withName: 'hello')
		add: (ClapPositional withName: 'who');
		matchOn: argv.
	
	matches should not be isMismatch.
	matches alias should equal: 'hello'.
	matches should be includesKey: 'who'.
	(matches at: 'who') should equal: 'world'