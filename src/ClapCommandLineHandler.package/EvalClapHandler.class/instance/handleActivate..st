event handling
handleActivate: aMatch
	"This method handles the output using the match argument."

	(self activateHelp: aMatch withMinArg: 1)
		ifTrue: [ ^ self ].
	aMatch class = ClapCommandMatch
		ifTrue: [ (aMatch
				includesKey: 'smalltalkExpression')
				ifTrue: [ self handleOutput: aMatch ]
				ifFalse: [ self handleUsage ] ]
		ifFalse: [ self handleError	"self
		quit. " ].
	(aMatch includesKey: 'save')
		ifTrue: [ ^ Smalltalk
				snapshot: true
				andQuit: (aMatch includesKey: 'no-quit') not ].
	(aMatch includesKey: 'no-quit')
		ifFalse: [ ^ self quit ]