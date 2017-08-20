activation
handleExit: exit for: aClapCommandLinehandler
"This method handles the exit for the given handler"
	Smalltalk isInteractive 
		ifFalse: [ ^ exit pass ].
		
	exit isSuccess 
		ifFalse: [ ^ Error signal: exit messageText ].
	
	self inform: aClapCommandLinehandler name, ' successfully finished'.
		
	"for failing subcommands return self which is used to check if the subcommand failed"
	exit isSuccess 
		ifTrue: [ ^ aClapCommandLinehandler ].