running
testWrongCommandMismatches
	| argv match |
	argv := ReadStream on: #('foo' '-d' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch