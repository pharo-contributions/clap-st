I represent a class which represents all elements(flags, positionals...) of a command, i.e. all elements this command can accept.

To create a new instance of this class, you must write this:
	ClapCommand withName: <CommandName>
	
And after, if you want to add a flag:
	addFlag: ClapFlag withName: <FlagName>
	
If you want to add a positional:
	addPositional: ClapPositional withName: <PositionalName>
	
If you want to add a subcommand:
	addSubCommand: <subCommand>
	
Example for the eval command: 
	(ClapCommand withName: 'eval')
		addFlag: ClapFlag withName: 'help';
		addPositional: ClapPositionnal withName: 'smalltalk 		expression'.