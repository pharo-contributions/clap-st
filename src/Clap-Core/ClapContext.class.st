"
I represent the (stateful) context in which command parsing happens.
Most importantly I own a stream over the sequence of arguments to parse.

For example, the command ""eval '1 + 2' "" is represented by this:
	ClapContext on: #('eval' '1 + 2')
"
Class {
	#name : #ClapContext,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'session',
		'obeyingExits',
		'root'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #accessing }
ClapContext class >> defaultRoot [
	^ ClapRoot new
	"setup default flags, omnipresent subcommands & basic meanings here"
]

{ #category : #accessing }
ClapContext class >> pragmaCommands [
	^ (PragmaCollector filter: [:prg | prg keyword = 'commandline']) reset
		collect: [ :pragma |
			| theClass theSelector |
			theClass := pragma method methodClass.
			theSelector := pragma method selector.
			self assert: [ theSelector isUnary ].
			
			theClass instanceSide
				perform: theSelector ]
]

{ #category : #'instance creation' }
ClapContext class >> with: rootCommand [
	^ self new
		root: rootCommand;
		yourself
]

{ #category : #'instance creation' }
ClapContext class >> withAll: commandCandidates [
	^ self with: (self defaultRoot addAll: commandCandidates; yourself)
]

{ #category : #'instance creation' }
ClapContext class >> withPragmaCommands [ 
	^ self withAll: self pragmaCommands
]

{ #category : #activation }
ClapContext >> activateWith: args [
	^ self
		activateWith: args
		onExit: [ :exit | self handleExit: exit ]
]

{ #category : #activation }
ClapContext >> activateWith: args onExit: exitBlock [
	^ [ self
			rememberSession;
			interpret: args
	]
	on: Exit
	do: exitBlock
]

{ #category : #accessing }
ClapContext >> arguments [
	^ arguments
]

{ #category : #initialization }
ClapContext >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #initialization }
ClapContext >> beObeyingExits [
	obeyingExits := true
]

{ #category : #accessing }
ClapContext >> documenter [
	^ ClapDocumenter on: (ClapDocumentationFormatter on: self stdout)
]

{ #category : #running }
ClapContext >> exit: status [
	^ (Exit status: status) signal
]

{ #category : #running }
ClapContext >> exit: status message: message [
	^ (Exit status: status) signal: message
]

{ #category : #running }
ClapContext >> exitFailure: message [
	^ Exit signalFailure: message
]

{ #category : #running }
ClapContext >> exitSuccess [
	^ Exit signalSuccess
]

{ #category : #running }
ClapContext >> exitSuccess: message [
	^ Exit signalSuccess: message
]

{ #category : #activation }
ClapContext >> handleExit: exit [
	self hasSessionChanged ifTrue: [ ^ self ].

	self shouldObeyExit
		ifTrue: [ exit pass ]
		ifFalse: [
			exit isSuccess
				ifFalse: [ exit resignalAs: (Error new messageText: exit messageText) ] ]
]

{ #category : #activation }
ClapContext >> hasSessionChanged [
	^ session ~~ Smalltalk session
]

{ #category : #activation }
ClapContext >> ifMatch: matchBlock ifMismatch: failBlock [
	^ (self root matchOn: self arguments readStream)
		ifMatch: matchBlock
		ifMismatch: failBlock

]

{ #category : #initialization }
ClapContext >> initialize [
	arguments := #().
	obeyingExits := false
]

{ #category : #activation }
ClapContext >> interpret: argumentsSequence [
	^ self arguments: argumentsSequence;
		ifMatch: [ :match |
			match value: self.
			self exitSuccess ]
		ifMismatch: [ self noneMatched ]
]

{ #category : #activation }
ClapContext >> noneMatched [
	^ self exitFailure: 'Unknown command'
]

{ #category : #activation }
ClapContext >> rememberSession [
	session := Smalltalk session
]

{ #category : #accessing }
ClapContext >> root [
	^ root ifNil: [ root := ClapRoot new ]
]

{ #category : #initialization }
ClapContext >> root: aCommand [
	root := aCommand
]

{ #category : #testing }
ClapContext >> shouldObeyExit [
	^ obeyingExits and: [ Smalltalk isInteractive not ]
]

{ #category : #accessing }
ClapContext >> stderr [
	^ VTermOutputDriver stderr
]

{ #category : #accessing }
ClapContext >> stdin [
	^ Stdio stdin
]

{ #category : #accessing }
ClapContext >> stdout [
	^ VTermOutputDriver stdout
]
