as yet unclassified
activateHelp: aMatch withMinArg: arg
	"Default help implementation, running #help if the only argument is --help "

	((aMatch includesKey: 'help')
		or: [ self arguments size = arg ])
		ifTrue: [ self help. (self print:'debug').
			^ true ].
	^ false