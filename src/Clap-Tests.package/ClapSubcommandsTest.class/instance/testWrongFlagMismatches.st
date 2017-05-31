running
testWrongFlagMismatches
	<expectedFailure "matching stops before the flag and declares success">
	| argv match |
	argv := ClapContext on: #('clap' '-f' 'bar/baz/qux' 'this').
	match := clap matchOn: argv.
	
	match should be isMismatch