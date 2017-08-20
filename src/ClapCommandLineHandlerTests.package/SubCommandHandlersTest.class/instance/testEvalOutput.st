tests
testEvalOutput
	| match |
	match := EvalClapHandler new run: (ClapContext on: #('eval' '1+2' )).
	self assert: ((EvalClapHandler new handleOutput: match) )  equals: '3'.