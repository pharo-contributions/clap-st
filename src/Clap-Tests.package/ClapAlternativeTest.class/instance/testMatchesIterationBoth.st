tests
testMatchesIterationBoth
	| block |
	(flagOne stub matchOn: argv) willReturn: okMatch.
	(flagTwo stub matchOn: argv) willReturn: okMatch.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) twice