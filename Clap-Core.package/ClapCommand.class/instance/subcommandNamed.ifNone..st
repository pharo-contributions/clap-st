accessing
subcommandNamed: specName ifNone: aBlock
	^ subcommands
		detect: [ :cmd | cmd canonicalName = specName ]
		ifNone: aBlock