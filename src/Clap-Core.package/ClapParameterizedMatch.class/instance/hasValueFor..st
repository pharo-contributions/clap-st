testing
hasValueFor: parameter
	^ arguments anySatisfy: [ :arg | arg specification = parameter ]