accessing
recordPositionalMatch: aMatch
	(arguments notEmpty and: [ arguments last acceptsPositional ])
		ifTrue: [ arguments last recordPositionalMatch: aMatch ]
		ifFalse: [ arguments add: aMatch ]