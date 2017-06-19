tests
testMatchesIterationNone
	| block |
	block := Mock named: 'aBlock'.
	
	subject matchesOn: argv do: block.
	
	block should not receive cull: okMatch