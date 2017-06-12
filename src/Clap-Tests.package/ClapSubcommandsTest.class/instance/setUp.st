running
setUp
	dirFlag := (ClapFlag withName: 'directory')
		addPositional: (ClapPositional withName: 'DIR');
		longForm: 'directory';
		shortForm: 'd'.
	slowFlag := (ClapFlag withName: 'slow')
		longForm: 'slow';
		shortForm: 's'.
	encore := (ClapFlag withName: 'encore')
		longForm: 'encore';
		shortForm: 'e'.
	clap := (ClapCommand withName: 'clap')
		addFlag: dirFlag;
		addSubcommand: ((ClapCommand withName: 'this') addFlag: slowFlag);
		addSubcommand:
			((ClapCommand withName: 'that')
				addFlag: encore;
				addPositional: (ClapPositional withName: 'clappee'))