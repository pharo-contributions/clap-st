initialization
initialize
	super initialize.
	subcommands := OrderedCollection new.
	flags := OrderedCollection new.
	groups := OrderedCollection new.
	patterns := OrderedCollection new