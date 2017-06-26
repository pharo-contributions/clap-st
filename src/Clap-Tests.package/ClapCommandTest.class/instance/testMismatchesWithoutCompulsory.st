tests
testMismatchesWithoutCompulsory
	| match |
	subject addCompulsory: (ClapPositional withName: 'class') asCompulsory.
	argv := ClapContext on: #('foo').
	match := subject matchOn: argv.
	match should be isMismatch  