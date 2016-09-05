tests
testShoutingAfterthought
	| argv match |
	argv := #('hello' 'world' '-s') readStream.

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'