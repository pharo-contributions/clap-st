running
setUp
	dirFlag := (ClapFlag withName: 'directory')
		addPositional: (ClapPositional withName: 'DIR').
	slowFlag := ClapFlag withName: 'slow'.
	
	clap := (ClapCommand withName: 'clap')
		addFlag: dirFlag;
		addSubcommand: ((ClapCommand withName: 'this')
			addFlag: slowFlag);
		addSubcommand: ((ClapCommand withName: 'that')
			addFlag: (ClapFlag withName: 'encore');
			addPositional: (ClapPositional withName: 'clappee'))