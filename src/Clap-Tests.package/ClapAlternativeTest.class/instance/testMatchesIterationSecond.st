tests
testMatchesIterationSecond
	| block |
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) once