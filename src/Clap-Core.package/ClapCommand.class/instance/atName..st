accessing
atName: specName
	^ self subcommandNamed: specName ifNone:
		[ self flagNamed: specName ifNone:
			[ super atName: specName ] ]