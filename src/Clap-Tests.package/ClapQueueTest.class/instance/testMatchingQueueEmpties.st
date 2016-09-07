tests
testMatchingQueueEmpties
	| match arg |
	argv stub atEnd willReturn: false.
	argv stub next willReturn: 'foo'.
	arg := ClapPositional withName: 'arg'.
	
	subject push: arg.
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match value should equal: 'foo'.
	subject should be isEmpty