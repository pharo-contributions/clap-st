tests
testMatchingBoth
	| match |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	
	match := subject matchOn: argv.
	
	match should not be isMismatch.
	match should be: okMatch