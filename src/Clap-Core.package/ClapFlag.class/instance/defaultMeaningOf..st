evaluating
defaultMeaningOf: aMatch
	^ positionals collect: [ :each |
		(aMatch atName: each canonicalName) value ]