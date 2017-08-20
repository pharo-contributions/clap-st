tests
testEvalActivate
	| match |
	match := EvalClapHandler new run: (ClapContext on: #('eval' '1+2' )).
	self assert: ((EvalClapHandler new activate: match) class )  equals: EvalClapHandler.