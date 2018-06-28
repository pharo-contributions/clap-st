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
		'commandCandidates',
		'arguments',
		'session'
	],
	#category : #'Clap-Core-Activation'
}

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
ClapContext class >> with: commandCandidate [
	^ self new
		candidates: { commandCandidate };
		yourself
]

{ #category : #'instance creation' }
ClapContext class >> withAll: commandCandidates [ 
	^ self new
		candidates: commandCandidates;
		yourself
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

{ #category : #'testing - deprecated' }
ClapContext >> atEnd [
	^ self arguments atEnd
]

{ #category : #initialization }
ClapContext >> candidates: commandSpecifications [
	commandCandidates := commandSpecifications
]

{ #category : #activation }
ClapContext >> detectMatching: matchBlock ifNone: failBlock [
	commandCandidates do: [ :each |
		(each matchOn: self arguments readStream)
			ifMatch: [ :match |
				^ matchBlock value: match ] ].

	^ failBlock value
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
	^ self hasSessionChanged
		ifTrue: [ self ]
		ifFalse: [
			Smalltalk isInteractive
				ifTrue: [
					exit isSuccess
						ifFalse: [ exit resignalAs: (Error new messageText: exit messageText) ] ]
				ifFalse: [ exit pass ]
		]
]

{ #category : #activation }
ClapContext >> hasSessionChanged [
	^ session ~~ Smalltalk session
]

{ #category : #initialization }
ClapContext >> initialize [
	commandCandidates := 	#().
	arguments := #()
]

{ #category : #activation }
ClapContext >> interpret: argumentsSequence [
	^ self arguments: argumentsSequence;
		detectMatching: [ :match |
			match value: self.
			self exitSuccess ]
		ifNone: [ self noneMatched ]
]

{ #category : #'accessing - deprecated' }
ClapContext >> next [
	^ self arguments next
]

{ #category : #activation }
ClapContext >> noneMatched [
	^ self exitFailure: 'Unknown command'
]

{ #category : #'accessing - deprecated' }
ClapContext >> peek [
	^ self arguments peek
]

{ #category : #activation }
ClapContext >> rememberSession [
	session := Smalltalk session
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
