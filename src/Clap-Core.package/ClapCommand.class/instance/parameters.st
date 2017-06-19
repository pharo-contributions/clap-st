accessing
parameters
	^ ClapAlternative new
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals)