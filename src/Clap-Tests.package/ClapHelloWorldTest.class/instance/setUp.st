running
setUp
	hello := (ClapCommand withName: 'hello')
		add: (ClapFlag withName: 'shout');
		add: (ClapPositional withName: 'who')
