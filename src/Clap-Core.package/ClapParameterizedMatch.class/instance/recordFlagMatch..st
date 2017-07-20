accessing
recordFlagMatch: aMatch
	(arguments notEmpty and: [ arguments last acceptsFlag ])
		ifTrue: [ arguments last recordFlagMatch: aMatch ]
		ifFalse: [ arguments add: aMatch ]