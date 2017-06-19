tests
testAddingToParentAddsByName
	| parent specName |
	specName := Mock new.
	specification stub canonicalName willReturn: specName.
	parent := Mock named: 'parent'.
	(parent stub recordParameterMatch: subject) willReturnYourself.
	
	subject recordIn: parent.
	
	(parent should receive recordParameterMatch: subject) once