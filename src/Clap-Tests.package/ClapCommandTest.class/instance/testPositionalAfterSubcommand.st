tests
testPositionalAfterSubcommand
	| subcommand match |
	subcommand := (ClapCommand withName: 'this') addFlag: (ClapFlag withName: 'force').
	subject addSubcommand: subcommand.
	subject addPositional: (ClapPositional withName: 'class').
	argv := ClapContext on: #('foo' 'this' 'Object').
	match := subject matchOn: argv.
	match should be isMismatch