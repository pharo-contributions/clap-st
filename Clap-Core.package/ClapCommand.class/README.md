I represent a command or subcommand.

Commands are recognized by a keyword, possibly with aliases for convenience.
A command can be nested as a subcommand of another one, and can have any number of subcommands.

Sibling subcommands are mutually exclusive: they are a way to organize and select behavior under their parent command.


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