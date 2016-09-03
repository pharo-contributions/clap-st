initialization
initialize
	super initialize.
	subcommands := OrderedCollection new.
	flags := ClapAlternative new