initialization
initialize
"This method initializes the super class methods and also initializes the class instance variables."
	super initialize.
	session := Smalltalk session.
	self 
		initializeStdout;
		initializeStderr.
	commandLine := CommandLineArguments new.
	handlerCollector := ClapSubclassHandlerCollectorStrategy new.