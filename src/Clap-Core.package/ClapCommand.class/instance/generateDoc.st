doc
generateDoc
	Stdio stdout
		<< 'USAGE:';
		lf.
	self printUsage: ''.
	Stdio stdout lf.
	self print: 'OPTIONS:' elementsOf: flags.
	self print: 'ARGS:' elementsOf: positionals.
	self print: 'COMMANDS:' elementsOf: subcommands