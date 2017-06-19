accessing
atName: specName
	^ self
		positionalNamed: specName
		ifNone: [ nil ]