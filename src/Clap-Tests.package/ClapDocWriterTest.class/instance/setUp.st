running
setUp
	| pos flag |
	subject := ClapDocWriter new: '' writeStream.
	pos := ClapPositional withName: 'class'.
	pos description: 'Name of a class'.
	flag := ClapFlag withName: 'force'.
	flag description: 'force removing'.
	argv := (ClapCommand withName: 'foo')
		addPositional: pos;
		addFlag: flag.
	newLine := subject newLineString