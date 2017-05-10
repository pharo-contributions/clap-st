tests
testMatchesWithWrongFlag
	| match |
	subject addFlag: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--methods' 'Object').
	argv stub next willReturnValueFrom: #('foo' '--methods' 'Object').
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	match should be isMismatch.
