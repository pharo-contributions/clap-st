running
testWrongFlagMismatches
	| argv match |
	argv := ClapContext on: #('clap' '-f' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch