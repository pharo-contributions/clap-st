tests
testShoutingAfterthought
	| argv match |
	argv := ClapContext on: #('hello' 'world' '-s').

	match := hello matchOn: argv.

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'