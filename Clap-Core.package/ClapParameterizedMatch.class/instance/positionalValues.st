evaluating
positionalValues
	^ specification positionals
		collect: [ :each | (self at: each) value ]