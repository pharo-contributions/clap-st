private
takeArgs: aCommand
	| c |
	c := OrderedCollection new.
	c add: aCommand flags; add: aCommand positionals; add: aCommand subcommands.
	^ c