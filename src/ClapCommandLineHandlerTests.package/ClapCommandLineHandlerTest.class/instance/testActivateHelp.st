tests
testActivateHelp
	| match1 handler match2 |
	handler := EvalClapHandler new.
	(handler stub arguments) willReturn: #('eval' '-h').
	match1:= EvalClapHandler new run: (ClapContext on:#('eval' '-h')).
	match2:= EvalClapHandler new run: (ClapContext on:#('eval' 'tes')).
	self assert: ( (handler activateHelp:match1) ) .
	(handler stub arguments) willReturn: #('eval' 'tes').
	self deny: ( (handler activateHelp:match2) ).
	handler recoverFromGHMutation.