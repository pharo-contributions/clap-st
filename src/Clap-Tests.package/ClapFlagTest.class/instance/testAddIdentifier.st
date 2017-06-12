tests
testAddIdentifier
	| match |
	subject addIdentifier: '+F'.
	argv stub peek willReturn: '+F'.
	argv stub next willReturn: '+F'.
	match := subject matchOn: argv.
	match should not be isMismatch 