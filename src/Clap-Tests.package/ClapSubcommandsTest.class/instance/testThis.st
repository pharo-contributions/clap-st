running
testThis
	| argv match |
	argv := ReadStream on: #('clap' 'this').
	match := clap matchOn: argv.
	
	match should not be isMismatch.
	match should not be includesKey: 'directory'.
	match should be includesKey: 'this'.
	match should not be includesKey: 'that'.
	(match at: 'this') should not be isMismatch.
	(match at: 'this') should not be includesKey: 'slow'