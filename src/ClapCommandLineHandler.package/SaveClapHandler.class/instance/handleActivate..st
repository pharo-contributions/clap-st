event handling
handleActivate: aMatch
	"This method handles the output using the match argument."

	(self activateHelp: aMatch withMinArg: 2)
		ifTrue: [ ^ self ].
	aMatch class = ClapCommandMatch
		ifTrue: [ (aMatch includesKey: 'imageName')
				ifTrue: [ self handleOutput: aMatch.
					^ self quit ].
			self handleUsage ].
	self handleError.
	^ self exitFailure