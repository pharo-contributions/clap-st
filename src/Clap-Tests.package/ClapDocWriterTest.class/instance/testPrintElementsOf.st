tests
testPrintElementsOf
	| expected |
	expected := newLine , 'OPTIONS:' , newLine.
	expected := expected , '--force,-f ' , String tab , 'force removing' , newLine.
	subject printCategory: 'OPTIONS:' of: argv flags.
	subject stream contents should equal: expected