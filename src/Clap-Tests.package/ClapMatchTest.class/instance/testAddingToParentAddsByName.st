tests
testAddingToParentAddsByName
	| parent specName |
	specName := Mock new.
	specification stub canonicalName willReturn: specName.
	parent := Mock named: 'parent'.
	(parent stub at: specName put: subject) willReturnYourself.
	
	subject addTo: parent.
	
	(parent should receive at: specName put: subject) once