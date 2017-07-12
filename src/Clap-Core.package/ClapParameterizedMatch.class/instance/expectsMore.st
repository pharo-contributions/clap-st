testing
expectsMore
	^ self specification positionals
		anySatisfy: [ :pos | self hasValueFor: pos ]