tests
testPrintUsageOfSubcommandWithMultipleSubcommands
	| expected subcommand |
	expected := 'foo --force,-f <class> git add ' , String cr.
	expected := expected , 'foo --force,-f <class> git brench ' , String cr.
	subcommand := (ClapCommand withName: 'git')
		addSubcommand: (ClapCommand withName: 'add');
		addSubcommand: (ClapCommand withName: 'brench').
	argv addSubcommand: subcommand.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected