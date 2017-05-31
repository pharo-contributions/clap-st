accessing
shortArgv
	| arg |
	arg := Mock named: 'argv'.
	arg stub peek willReturn: '-f'.
	arg stub next willReturn: '-f'.
	^ arg
	