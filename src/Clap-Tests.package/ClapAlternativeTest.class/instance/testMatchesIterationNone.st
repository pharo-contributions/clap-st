tests
testMatchesIterationNone
	| block |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	block should not receive cull: okMatch