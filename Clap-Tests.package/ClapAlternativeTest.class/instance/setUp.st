running
setUp
	argv := Mock named: 'argv'.
	
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	
	mismatch := Mock named: 'nope'.
	mismatch stub isMismatch willReturn: true.
	
	flagOne := Mock named: 'one'.
	flagTwo := Mock named: 'two'.

	"Default return values, important for tests which exercise matching loops"
	(flagOne stub matchOn: argv) willReturn: mismatch.
	(flagTwo stub matchOn: argv) willReturn: mismatch.
	
	subject := ClapAlternative new
		add: flagOne;
		add: flagTwo
