tests
testMatchingNone
	| match |
	match := subject matchOn: argv.
	
	match should be isMismatch