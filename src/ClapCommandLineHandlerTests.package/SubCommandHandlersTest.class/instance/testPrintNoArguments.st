tests
testPrintNoArguments
	" This is to test if in case no arguments are given after the command name"

	| match |
	match := PrintClapHandler new
		run: (ClapContext on: #('print')).
	self assert:
			(PrintClapHandler new
				activateHelp: match
				withMinArg: 1) class
		equals: false class