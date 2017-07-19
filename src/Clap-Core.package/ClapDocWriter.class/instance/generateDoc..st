doc
generateDoc: aCommand
	"The main method to generate doc"

	self addToStream: 'USAGE:' , self newLineString .
	self printUsage: '' of: aCommand.
	self printOptions: aCommand.
	self printArgs: aCommand.
	self printCommands: aCommand