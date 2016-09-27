accessing
flagNamed: specName ifNone: aBlock
	^ flags
		detect: [ :flag | flag canonicalName = specName ]
		ifNone: aBlock