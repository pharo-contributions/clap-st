doc
docName
	| s |
	s := self longForm , ',' , self shortForm.
	positionals do: [ :p | s := s , ' ' , p docName ].
	^ s