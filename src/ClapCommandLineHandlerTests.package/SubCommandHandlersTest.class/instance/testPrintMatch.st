as yet unclassified
testPrintMatch
	| context1 context2 |
	context1 := ClapContext on: #('print').
	context2 := ClapContext on: #('prin').
	self assert: (PrintClapHandler new run: context1) class equals: ClapCommandMatch.
	self assert: (PrintClapHandler new run: context2) class equals: ClapMismatch.  