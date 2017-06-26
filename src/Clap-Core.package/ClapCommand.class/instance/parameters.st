accessing
parameters
	^ super parameters 
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals)