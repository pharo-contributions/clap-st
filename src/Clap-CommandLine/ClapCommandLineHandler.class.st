"
A thin layer to hook Clap into the existing command-line system
"
Class {
	#name : #ClapCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'Clap-CommandLine'
}

{ #category : #accessing }
ClapCommandLineHandler class >> commandName [
	^ 'clap'
]

{ #category : #activation }
ClapCommandLineHandler >> activate [
	[
		(ClapContext with: self subcommands)
			onExit: [ :exit | self handleExit: exit ];
			interpret: self arguments
	]
	forkAt: Processor userSchedulingPriority
	named: 'Clap commandline handler process'
]

{ #category : #activation }
ClapCommandLineHandler >> handleExit: exit [
	Smalltalk isInteractive
		ifFalse: [ ^ exit pass ].

	exit isSuccess
		ifFalse: [ ^ exit resignalAs: (Error new messageText: exit messageText) ]
]

{ #category : #activation }
ClapCommandLineHandler >> noneMatched [
	self exitFailure: 'Unknown command'
]

{ #category : #accessing }
ClapCommandLineHandler >> subcommands [
	^ (PragmaCollector filter: [:prg | prg keyword = 'commandline']) reset
		collect: [ :pragma |
			| theClass theSelector |
			theClass := pragma method methodClass.
			theSelector := pragma method selector.
			self assert: [ theSelector isUnary ].
			
			theClass instanceSide
				perform: theSelector ]
]
