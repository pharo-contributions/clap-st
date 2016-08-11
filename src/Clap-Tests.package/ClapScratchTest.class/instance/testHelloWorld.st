tests
testHelloWorld
	<expectedFailure>
	| matches argv |
	argv := Mock named: 'argv'.
	argv stub peek willReturnValueFrom: #('hello' 'world').
	argv stub next willReturnValueFrom: #('hello' 'world').
		
	matches := (ClapCommand withName: 'hello')
		add: (ClapPositional withName: 'who');
		matchesOn: argv.
	
	matches should not be isMismatch.
	matches should be includesKey: 'who'.
	(matches at: 'who') should equal: 'world'