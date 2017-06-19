tests
testShoutingWorld
	| argv match |
	argv := ClapContext on: #('hello' '--shout' 'world').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'