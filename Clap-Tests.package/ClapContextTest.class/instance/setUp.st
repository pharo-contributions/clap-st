running
setUp
	argv := Mock named: 'argv'.
	argv stub readStream willReturnYourself.
	
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	okMatch stub ifMismatch: Any.
	
	subject := ClapContext on: argv