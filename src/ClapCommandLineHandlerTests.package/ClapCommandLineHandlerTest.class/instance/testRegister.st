tests
testRegister
	| sessionHandlers |
	sessionHandlers := (SessionManager default startupList) select: [ :a | (a class = ClassSessionHandler)].
	self assert: (sessionHandlers anySatisfy: [ :a | a registeredClass == ClapCommandLineHandler] ) equals: true.
	self assert: (sessionHandlers anySatisfy: [ :a | a registeredClass == BasicCommandLineHandler] ) equals: false. 