testing
acceptsPositional
	^ self specification positionals
		anySatisfy: [ :pos | (self hasValueFor: pos) not ]