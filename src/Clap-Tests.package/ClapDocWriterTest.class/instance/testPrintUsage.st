tests
testPrintUsage
	| expected |
	expected := 'foo --force,-f <class> ' , String cr.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected