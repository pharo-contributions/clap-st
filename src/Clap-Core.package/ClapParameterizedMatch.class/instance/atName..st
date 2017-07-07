accessing
atName: aCanonicalName
	^ arguments detect: [ :arg | arg specification canonicalName = aCanonicalName ]