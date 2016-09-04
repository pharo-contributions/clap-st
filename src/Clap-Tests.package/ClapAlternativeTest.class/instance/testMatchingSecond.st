tests
testMatchingSecond
	| match |
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	
	match := subject matchOn: argv.
	
	match should be: okMatch