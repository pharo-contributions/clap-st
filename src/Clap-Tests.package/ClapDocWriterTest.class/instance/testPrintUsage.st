tests
testPrintUsage
	| expected |
	expected := 'foo --force,-f <class> ' , newLine.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected