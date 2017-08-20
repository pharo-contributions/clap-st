tests
testStartHandler
	| arguments |
	arguments:= #('eval' '1+2').
	self assert: ( (self classToTest) startHandler: arguments ) class equals: ClapCommandLineHandler 	