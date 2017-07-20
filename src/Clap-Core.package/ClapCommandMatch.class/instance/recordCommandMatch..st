as yet unclassified
recordCommandMatch: aMatch 
	(arguments notEmpty and: [ arguments last acceptsCommand ])
		ifTrue: [ arguments last recordCommandMatch: aMatch ]
		ifFalse: [  arguments add: aMatch ]