tests
testPositionalContext
	| ctx arg parent |
	arg := ClapPositional withName: 'foo'.
	(arg stub matchOn: argv) willReturn: okMatch.
	parent := Mock named: 'parent'.
	ctx := ClapContext on: argv.
	ctx defer: arg for: parent.

	ctx matchDeferred.

	arg should receive matchOn: argv.
	okMatch should receive addTo: parent