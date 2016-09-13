running
setUp
	clap := (ClapCommand withName: 'clap')
		addFlag: ((ClapFlag withName: 'directory')
			addPositional: (ClapPositional withName: 'DIR'));
		addSubcommand: ((ClapCommand withName: 'this')
			addFlag: (ClapFlag withName: 'slow'));
		addSubcommand: ((ClapCommand withName: 'that')
			addFlag: (ClapFlag withName: 'encore');
			addPositional: (ClapPositional withName: 'clappee'))