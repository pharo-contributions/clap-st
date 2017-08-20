combining
command
"This method defines a clapCommand for the handler."
	| flag1 flag2 positional |
	flag1 := (ClapFlag withName: 'deleteOld') meaning: [ :value | value isMismatch not ].
	flag2 := (ClapFlag withName: 'help') meaning: [ :value | value isMismatch not ].
	positional := ClapPositional withName: 'imageName'.
	^ (ClapCommand withName: 'save')
		addPositional: positional;
		addFlag: flag1;
		addFlag: flag2