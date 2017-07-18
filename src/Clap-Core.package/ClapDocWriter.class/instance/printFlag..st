doc
printFlag: aFlag
	| s |
	s := aFlag longForm , ',' , aFlag shortForm , ' '.
	aFlag positionals do: [ :p | s := s , (p accept: self) ].
	^ s