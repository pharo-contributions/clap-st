tests
testEvalMatch
	| match1 match2 |
	match1 := EvalClapHandler new run: (ClapContext on:#('eval' 'tes')).
	match2 := EvalClapHandler new run: (ClapContext on:#('eva' 'tes')).
	self assert: ((match1) class) equals: ClapCommandMatch . 
	self assert: ((match2) class) equals: ClapMismatch .	
