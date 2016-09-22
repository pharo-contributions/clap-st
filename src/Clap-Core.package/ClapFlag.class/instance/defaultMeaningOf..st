as yet unclassified
defaultMeaningOf: aMatch
	^ positionals collect: [ :each |
		(aMatch at: each canonicalName) value ]