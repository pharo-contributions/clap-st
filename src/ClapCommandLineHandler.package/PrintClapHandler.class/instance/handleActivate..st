event handling
handleActivate: aMatch
	"This method handles the output using the match argument."

	aMatch class ~= ClapCommandMatch
		ifTrue: [ self handleUsage.
			^ self exitFailure ].
	(self activateHelp: aMatch withMinArg: 0)
		ifTrue: [ ^ self ].
	self handleFlag: aMatch.
	^ self quit