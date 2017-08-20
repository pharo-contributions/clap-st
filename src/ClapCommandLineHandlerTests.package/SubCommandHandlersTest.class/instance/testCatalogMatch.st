tests
testCatalogMatch
	| context1 context2 |
	context1 := ClapContext on: #('get').
	context2 := ClapContext on: #('ge').
	self assert: (CatalogClapHandler new run: context1) class equals: ClapCommandMatch.
	self assert: (CatalogClapHandler new run: context2) class equals: ClapMismatch