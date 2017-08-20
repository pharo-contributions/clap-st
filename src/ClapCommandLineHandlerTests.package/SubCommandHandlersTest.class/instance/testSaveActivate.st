tests
testSaveActivate
	| match |
	match := SaveClapHandler new run: (ClapContext on: #('save' '-h')).
	self assert: (SaveClapHandler new activate: match) class equals: SaveClapHandler