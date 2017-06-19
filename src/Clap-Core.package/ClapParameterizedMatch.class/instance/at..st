accessing
at: aSpec
	^ arguments detect: [ :arg | arg specification = aSpec ]