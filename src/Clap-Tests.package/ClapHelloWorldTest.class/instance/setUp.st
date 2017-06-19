running
setUp
	hello := (ClapCommand withName: 'hello')
		addFlag: (ClapFlag withName: 'shout');
		addPositional: (ClapPositional withName: 'who')
