accessing
at: aSpec ifAbsent: aBlock
	^ arguments
		detect: [ :arg | arg specification = aSpec ]
		ifNone: aBlock