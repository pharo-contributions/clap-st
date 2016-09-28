running
testRootPositionalBeforeSubcommand
	| argv match |
	argv := ClapContext on: #('clap' '--directory' 'foo/bar/baz' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	((match atName: 'directory') atName: 'DIR') value should equal: 'foo/bar/baz'.
	(match at: dirFlag) value should equal: #( 'foo/bar/baz' )
