tests
testPrintOutput
	| instance match |
	instance := PrintClapHandler new.
	match := instance run: (ClapContext on: #('print' '-r' )).
	self assert: ((instance handleFlag: match) class )  equals: (PrintClapHandler).