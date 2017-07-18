doc
generateDoc: aCommand
	| categories args |
	categories := #('OPTIONS:' 'ARGS:' 'COMMANDS:').
	args := self takeArgs: aCommand.
	self addToStream: 'USAGE:' , String cr.
	self printUsage: '' of: aCommand.
	categories do: [ :c | self printCategory: c of: (args at: (categories indexOf: c)).
		 ]