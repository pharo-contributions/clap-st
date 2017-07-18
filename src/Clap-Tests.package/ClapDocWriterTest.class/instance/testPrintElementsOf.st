tests
testPrintElementsOf
	| expected |
	expected := String cr , 'OPTIONS:' , String cr.
	expected := expected , '--force,-f ' , String tab , 'force removing' , String cr.
	subject printCategory: 'OPTIONS:' of: argv flags.
	subject stream contents should equal: expected