tests
testEvalNoArguments
	" This is to test if in case no arguments are given after the command name"

	| match |
	match := EvalClapHandler new
		run: (ClapContext on: #('eval')).
	
	self
		assert:
			(EvalClapHandler new
				activateHelp: match
				withMinArg: 2) class
		equals: false class