doc
printUsage: aString
	| s |
	s := aString , self canonicalName , ' '.
	flags do: [ :f | s := s , f docName , ' ' ].
	positionals do: [ :p | s := s , p docName , ' ' ].
	subcommands do: [ :sc | sc printUsage: s ].
	subcommands size = 0
		ifTrue: [ Stdio stdout
				<< s;
				lf ]