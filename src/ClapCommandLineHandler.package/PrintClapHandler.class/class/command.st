combining
command
"This method defines a clapCommand for the handler."
	| flag command numeric_flag release_flag |
	flag := ( ClapFlag withName: 'help' ) meaning: [ :value | value isMismatch not ].
	numeric_flag := (ClapFlag withName: 'numeric') meaning: [ :value | value isMismatch not ].
	release_flag := (ClapFlag withName: 'release') meaning: [ :value | value isMismatch not ].
	command := (ClapCommand withName: 'print') addFlag: flag; addFlag: numeric_flag; addFlag: release_flag.
   ^ command.