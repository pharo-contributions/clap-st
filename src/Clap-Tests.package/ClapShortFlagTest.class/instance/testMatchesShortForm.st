tests
testMatchesShortForm
	| match |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match word should equal: '-f'