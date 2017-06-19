accessing
positionalNamed: specName ifNone: aBlock
	^ positionals
		detect: [ :arg | arg canonicalName = specName ]
		ifNone: aBlock