initialization
initialize
	super initialize.
	subcommands := OrderedCollection new.
	flags := OrderedCollection new.
	groups := ClapGroup newFrom: #()