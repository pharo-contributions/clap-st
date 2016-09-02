tests
testMatchingNone
	| match |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	
	match := subject matchOn: argv.
	
	match should be isMismatch