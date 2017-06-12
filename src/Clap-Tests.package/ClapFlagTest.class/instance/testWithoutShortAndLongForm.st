tests
testWithoutShortAndLongForm
	| match |
	subject longForm: ''.
	subject shortForm: ''.
	argv stub peek willReturn: '--foo'.
	match := subject matchOn: argv.
	match should be isMismatch.