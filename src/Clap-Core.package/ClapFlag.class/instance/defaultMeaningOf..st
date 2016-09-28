evaluating
defaultMeaningOf: aMatch
	^ positionals collect: [ :each |
		(aMatch at: each) value ]