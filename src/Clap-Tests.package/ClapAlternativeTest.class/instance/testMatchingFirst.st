tests
testMatchingFirst
	| match |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	
	match := subject matchOn: argv.
	
	match should be: okMatch