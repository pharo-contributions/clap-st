running
setUp
	argv := Mock named: 'argv'.
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	okMatch stub ifMismatch: Any.
	
	subject := ClapContext on: argv