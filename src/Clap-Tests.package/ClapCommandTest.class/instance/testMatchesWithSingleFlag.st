tests
testMatchesWithSingleFlag
	| match |
	subject addFlag: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--bar').
	argv stub next willReturnValueFrom: #('foo' '--bar').
	argv stub atEnd willReturn: true.
	argv stub atEnd
		willReturn: false;
		use: 1.
	match := subject matchOn: argv.
	"argv should receive next twice."
	"argv should receive atEnd twice."
	match should not be isMismatch.
	match should be includesKey: 'bar'