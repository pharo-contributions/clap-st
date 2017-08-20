combining
command
"This method defines a clapCommand for the handler."
	|flag1 flag2 flag3 positional command |
	flag1 := ( ClapFlag withName: 'no-quit' ) meaning: [ :value | value isMismatch not ].
	flag2 := ( ClapFlag withName: 'help' ) meaning: [ :value | value isMismatch not ].
	flag3 := ( ClapFlag withName: 'save' ) meaning: [ :value | value isMismatch not ].
	positional := (ClapPositional withName: 'smalltalkExpression').
	command := (ClapCommand withName: 'eval') addFlag: flag1; addFlag: flag2; addFlag: flag3;  addPositional: positional .
   ^ command.