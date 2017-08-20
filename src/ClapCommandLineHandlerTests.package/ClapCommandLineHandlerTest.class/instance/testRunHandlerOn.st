tests
testRunHandlerOn
	| arguments1 arguments2 |
	arguments1:= #('eval' 'tes').
	arguments2 := #('print').
	self assert: ( ClapCommandLineHandler new runHandler: arguments1 on: ((self classToTest) matchCommandName: arguments1 ) first ) class equals: ClapCommandLineHandler .
	self assert: ( ClapCommandLineHandler new runHandler: arguments2 on: ((self classToTest) matchCommandName: arguments2 ) first ) class equals: ClapCommandLineHandler.
	