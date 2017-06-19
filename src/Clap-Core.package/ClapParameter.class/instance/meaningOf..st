evaluating
meaningOf: aMatch
	^ meaningBlock
		ifNil: [ self defaultMeaningOf: aMatch ]
		ifNotNil: [ meaningBlock cull: aMatch ]