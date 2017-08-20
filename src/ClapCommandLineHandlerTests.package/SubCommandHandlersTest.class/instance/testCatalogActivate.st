tests
testCatalogActivate
	| match |
	match := CatalogClapHandler new
		run: (ClapContext on: #('get' '-h')).
	self
		assert:
			(CatalogClapHandler new activate: match)
				class
		equals: CatalogClapHandler