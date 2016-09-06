tests
testEmptyContext
	| ctx |
	ctx := ClapContext on: argv.
	
	ctx matchDeferred should be isMismatch.
	argv should not receive next