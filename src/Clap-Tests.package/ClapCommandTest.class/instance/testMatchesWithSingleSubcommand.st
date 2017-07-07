tests
testMatchesWithSingleSubcommand
	| match |
	subject addSubcommand: (ClapCommand withName: 'bar').
	argv := ClapContext on: #('foo' 'bar').
	match := subject matchOn: argv.
	match should not be isMismatch.
	match should be includesKey: 'bar'