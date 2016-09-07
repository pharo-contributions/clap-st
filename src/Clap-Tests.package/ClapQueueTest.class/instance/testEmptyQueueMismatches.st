tests
testEmptyQueueMismatches
	| match |
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch