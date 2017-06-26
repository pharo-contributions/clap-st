tests
testMatchesDelimitedValues
	| match |
	subject
		addPositional: (ClapPositional withName: 'class');
		addPositional: (ClapPositional withName: 'method').
	argv := ClapContext on: #('--foo=Object,comment').
	match := subject matchOn: argv.
	match should not be isMismatch