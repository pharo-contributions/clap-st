tests
testDuplicateCommandName
	| duplicateClass handler |
	duplicateClass := Mock new.
	duplicateClass stub command willReturn: (ClapCommand withName: 'eval').
	handler := ClapCommandLineHandler new handlerCollectionStrategy: (ClapHandlerCollectionStrategy new withAll:{EvalClapHandler . duplicateClass .}).
	self assert: ((handler matchCommandName: #('eval')) size) equals: 2.
	duplicateClass recoverFromGHMutation.