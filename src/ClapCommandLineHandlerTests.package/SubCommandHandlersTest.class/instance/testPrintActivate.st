tests
testPrintActivate
	| match |
	match := PrintClapHandler new run: (ClapContext on: #('print' '-h')).
	self assert: (PrintClapHandler new activate: match) class equals: PrintClapHandler