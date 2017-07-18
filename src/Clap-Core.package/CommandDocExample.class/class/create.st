instance creation
create
	| player mine move |
	player := ClapCommand withName: 'player'.
	mine := (ClapCommand withName: 'mine')
		addSubcommand: (ClapCommand withName: 'set');
		addSubcommand: (ClapCommand withName: 'remove').
	player addSubcommand: mine.
	move := (ClapCommand withName: 'move') addPositional: (ClapPositional withName: 'x');
		addPositional: (ClapPositional withName: 'y').
	player addSubcommand: move.
	^ player