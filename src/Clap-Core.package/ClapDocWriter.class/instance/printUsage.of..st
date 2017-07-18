doc
printUsage: aString of: aCommand
	| aux |
	aux := aCommand accept: self.
	aCommand flags do: [ :f | aux := aux , (f accept: self) ].
	aCommand positionals do: [ :p | aux := aux , (p accept: self) ].
	aCommand subcommands do: [ :sc | self printUsage: aString , aux of: sc ].
	aCommand subcommands size = 0
		ifTrue: [ self addToStream: aString , aux , String cr ]