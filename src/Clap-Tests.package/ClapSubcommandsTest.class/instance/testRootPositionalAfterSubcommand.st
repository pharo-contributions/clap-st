running
testRootPositionalAfterSubcommand
	| argv match |
	argv := ClapContext on: #('clap' 'this' '--directory' 'foo/bar/baz').
	match := clap matchOn: argv.
	
	match should be isMismatch.