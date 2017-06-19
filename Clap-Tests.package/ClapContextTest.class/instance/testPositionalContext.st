tests
testPositionalContext
	| arg parent |
	arg := ClapPositional withName: 'foo'.
	(arg stub matchOn: argv) willReturn: okMatch.
	parent := Mock named: 'parent'.
	
	subject defer: arg for: parent.
	subject matchDeferred.

	arg should receive matchOn: argv.
	okMatch should receive recordIn: parent