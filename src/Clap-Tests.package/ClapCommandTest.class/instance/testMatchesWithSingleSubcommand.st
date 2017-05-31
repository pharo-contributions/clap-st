tests
testMatchesWithSingleSubcommand
	| match |
	subject addSubcommand: (ClapCommand withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'bar').
	argv stub next willReturnValueFrom: #('foo' 'bar').
	argv stub atEnd willReturn: true.
	argv stub atEnd willReturn: false; use: 3.
	
	match := subject matchOn: argv.
	
	argv should receive next twice.
	match should not be isMismatch.
	match should be includesKey: 'bar'