printing
handleOutput: aMatch
	"This method is used to handle the output with the match as input."
	| output |
	output := OpalCompiler evaluate: ((aMatch atName: 'smalltalkExpression') value).
	self print: (output asString).
	^ output asString.