combining
command
"This method defines a clapCommand for the handler."

	| flag1 flag2 positional |
	flag1 := (ClapFlag withName: 'help') meaning: [ :value | value isMismatch not ].
	flag2 := (ClapFlag withName: 'version')
		addPositional: (ClapPositional withName: 'versionNumber').
	positional := ClapPositional withName: 'projectName'.
	^ (ClapCommand withName: 'get')
		addFlag: flag1;
		addFlag: flag2;
		addPositional: positional