tests
testFooBarBaz
	| matches argv |
	argv := Mock named: 'argv'.
	argv stub peek willReturnValueFrom: #('foo' 'bar' 'baz').
	argv stub next willReturnValueFrom: #('foo' 'bar' 'baz').
		
	matches := (ClapCommand withName: 'foo')
		add: (ClapPositional withName: 'one');
		add: (ClapPositional withName: 'two');
		matchOn: argv.
	
	matches should not be isMismatch.
	matches should be includesKey: 'one'.
	(matches at: 'one') should equal: 'bar'.
	matches should be includesKey: 'two'.
	(matches at: 'two') should equal: 'baz'