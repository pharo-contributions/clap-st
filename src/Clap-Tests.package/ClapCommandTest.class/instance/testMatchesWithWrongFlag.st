tests
testMatchesWithWrongFlag
	| match |
	subject addFlag: ((ClapFlag withName: 'bar') longForm: 'bar';shortForm: 'b').
	argv stub peek willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub next willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub atEnd willReturn: false.
	match := subject matchOn: argv.
	match should be isMismatch