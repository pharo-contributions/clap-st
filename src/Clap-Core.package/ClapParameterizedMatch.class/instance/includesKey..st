testing
includesKey: canonicalName
	^ arguments anySatisfy: [ :arg | arg specification canonicalName = canonicalName ]