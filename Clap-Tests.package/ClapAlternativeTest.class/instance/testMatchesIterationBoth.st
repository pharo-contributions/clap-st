tests
testMatchesIterationBoth
	| block |
	(flagOne stub matchOn: argv) willReturn: okMatch; useOnce.
	(flagTwo stub matchOn: argv) willReturn: okMatch; useOnce.
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	(block should receive cull: okMatch) twice