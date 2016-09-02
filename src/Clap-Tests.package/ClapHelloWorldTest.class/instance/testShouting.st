tests
testShouting
	<expectedFailure "flags are now stored separately from positionals">
	| argv match |
	argv := #('hello' '--shout' 'world') readStream.
	
	match := hello matchOn: argv.
	
	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'