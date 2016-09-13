running
testRootPositionalBeforeSubcommand
	<expectedFailure "missing interpreted value of flags">
	| argv match |
	argv := ReadStream on: #('clap' '--directory' 'foo/bar/baz' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match at: 'directory') value should equal: 'foo/bar/baz'.
