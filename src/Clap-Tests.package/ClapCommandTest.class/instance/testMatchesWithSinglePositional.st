tests
testMatchesWithSinglePositional
	| match |
	subject addPositional: (ClapPositional withName: 'bar').
	argv := ClapContext on: #('foo' 'valueforbar').
	match := subject matchOn: argv.
	match should not be isMismatch.
	match word should equal: 'foo'.
	match should be includesKey: 'bar'.	"FIXME not sure about the dictionary protocol"
	(match atName: 'bar') word should equal: 'valueforbar'