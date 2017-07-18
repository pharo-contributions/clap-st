doc
generateDoc: aCommand
	"The main method to generate doc"

	
	self addToStream: 'USAGE:' , String cr.
	self printUsage: '' of: aCommand.
	self printOptions: aCommand.
	self printArgs: aCommand.
	self printCommands: aCommand