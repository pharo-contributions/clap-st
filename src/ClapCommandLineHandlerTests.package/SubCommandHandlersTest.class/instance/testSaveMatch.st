tests
testSaveMatch
	| context1 context2 |
	context1 := ClapContext on: #('save').
	context2 := ClapContext on: #('sav').
	self
		assert: (SaveClapHandler new run: context1) class
		equals: ClapCommandMatch.
	self
		assert: (SaveClapHandler new run: context2) class
		equals: ClapMismatch