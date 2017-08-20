as yet unclassified
testTryMatch
	| testClass1 arg1 arg2 command context1 context2 |
	testClass1 := self classToTest handlers at:1.
	command := testClass1 command.
	arg1 := OrderedCollection with: (command canonicalName).
	arg2 := OrderedCollection with: (command canonicalName,'A').
	context1 := ClapContext on: arg1.
	context2 := ClapContext on: arg2.
	self assert: (testClass1 new tryMatch: context1) class equals: testClass1.
	self assert: (testClass1 new tryMatch: context2) class equals: testClass1.