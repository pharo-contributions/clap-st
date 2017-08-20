event handling
handleActivate: aMatch
	"This method handles the output using the match argument."

	aMatch class ~= ClapCommandMatch
		ifTrue: [ self handleError.
			^ self exitFailure ].
	(self activateHelp: aMatch withMinArg: 2)
		ifTrue: [ ^ self ].
	[ (aMatch includesKey: 'projectName')
		ifTrue: [ self handleOutput: aMatch.
			^ self quit ].
	self handleUsage ]