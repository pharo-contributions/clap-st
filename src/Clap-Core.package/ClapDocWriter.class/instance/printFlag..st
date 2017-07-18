doc
printFlag: aFlag
	"Returns the flag name formatting to print it in the doc"
	| s |
	s := aFlag longForm , ',' , aFlag shortForm , ' '.
	aFlag positionals do: [ :p | s := s , (p accept: self) ].
	^ s