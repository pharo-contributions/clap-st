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
	[ [ | context match command |
			context := ClapContext on: self arguments.

			command := self subcommands
				detect: [ :each |
					match := each matchPremiseOn: context.
					match isMismatch not ]
				ifNone: [ ^ self noneMatched ].

			command with: match matchOn: context.
			match value.
	
			"If we reach here, then all went well"
			self exitSuccess
		] on: Exit do: [ :exit | self handleExit: exit ]
	] forkAt: Processor userSchedulingPriority named: 'Clap commandline handler process'
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
