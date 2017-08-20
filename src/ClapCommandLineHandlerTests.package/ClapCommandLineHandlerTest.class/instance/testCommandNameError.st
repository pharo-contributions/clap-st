tests
testCommandNameError
	| arguments |
	arguments:= #('Evala').
	self assert: ((self classToTest ) startHandler: arguments) equals: Error