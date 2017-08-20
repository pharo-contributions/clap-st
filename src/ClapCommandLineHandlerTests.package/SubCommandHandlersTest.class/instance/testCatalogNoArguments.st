tests
testCatalogNoArguments
	" This is to test if in case no arguments are given after the command name"

	| match |
	match := CatalogClapHandler new run: (ClapContext on: #('get')).
	self
		assert: (CatalogClapHandler new activateHelp: match withMinArg: 1) class
		equals: false class