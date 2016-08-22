matching
absent
	^ defaultValue
		ifNil: [ self mismatch ]
		ifNotNil: [ ClapPositionalMatch of: self value: defaultValue ]