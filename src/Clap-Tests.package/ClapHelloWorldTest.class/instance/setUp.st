running
setUp
	hello := (ClapCommand withName: 'hello')
		addFlag: ((ClapFlag withName: 'shout') longForm: 'shout';shortForm: 's');
		addPositional: (ClapPositional withName: 'who')