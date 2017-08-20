as yet unclassified
activateHelp: aMatch
	"Default help implementation, running #help if the only argument is --help "
	((aMatch includesKey: 'help') or: [ self arguments size = 1 ])
		ifTrue: [ 
			self help.
			^ true ].
	^ false