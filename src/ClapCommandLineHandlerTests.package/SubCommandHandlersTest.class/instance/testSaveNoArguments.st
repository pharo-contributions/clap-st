tests
testSaveNoArguments
	" This is to test if in case no arguments are given after the command name"

	| match |
	match := SaveClapHandler new run: (ClapContext on: #('save')).
	self
		assert: (SaveClapHandler new activateHelp: match withMinArg: 1) class
		equals: false class