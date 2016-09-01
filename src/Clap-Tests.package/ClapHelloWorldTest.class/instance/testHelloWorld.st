tests
testHelloWorld
	| argv match |
	argv := #('hello' 'world') readStream.
	
	match := hello matchOn: argv.
	
	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should be includesKey: 'who'.
	(match at: 'who') should equal: 'world'