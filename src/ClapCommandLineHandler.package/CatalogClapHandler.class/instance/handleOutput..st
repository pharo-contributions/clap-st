printing
handleOutput: aMatch
	" if help flag is send message handleUsage else send message to getProject:"

	(aMatch includesKey: 'help') value
		ifTrue: [ ^ self handleUsage ].
	^ self getProject: aMatch