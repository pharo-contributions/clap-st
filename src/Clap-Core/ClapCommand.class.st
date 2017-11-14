"
I represent a command or subcommand.

Commands are recognized by a keyword, possibly with aliases for convenience.
A command can be nested as a subcommand of another one, and can have any number of subcommands.

Sibling subcommands are mutually exclusive: they are a way to organize and select behavior under their parent command.


To create a new instance of this class, you must write this:
	ClapCommand withName: <CommandName>
	
And after, if you want to add a flag:
	addFlag: ClapFlag withName: <FlagName>
	
If you want to add a positional:
	addPositional: ClapPositional withName: <PositionalName>
	
If you want to add a subcommand:
	addSubCommand: <subCommand>
	
Example for the eval command: 
	(ClapCommand withName: 'eval')
		addFlag: ClapFlag withName: 'help';
		addPositional: ClapPositionnal withName: 'smalltalk 		expression'.
"
Class {
	#name : #ClapCommand,
	#superclass : #ClapParameterized,
	#instVars : [
		'subcommands',
		'flags',
		'patterns',
		'groups'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #adding }
ClapCommand >> addFlag: aFlag [
	flags add: aFlag
]

{ #category : #adding }
ClapCommand >> addSubcommand: aCommand [
	subcommands add: aCommand
]

{ #category : #accessing }
ClapCommand >> atName: specName [
	^ self subcommandNamed: specName ifNone:
		[ self flagNamed: specName ifNone:
			[ super atName: specName ] ]
]

{ #category : #accessing }
ClapCommand >> flagNamed: specName ifNone: aBlock [
	^ flags
		detect: [ :flag | flag canonicalName = specName ]
		ifNone: aBlock
]

{ #category : #doc }
ClapCommand >> generateDoc [
	Stdio stdout
		<< 'USAGE:';
		lf.
	self printUsage: ''.
	Stdio stdout lf.
	self print: 'OPTIONS:' elementsOf: flags.
	self print: 'ARGS:' elementsOf: positionals.
	self print: 'COMMANDS:' elementsOf: subcommands
]

{ #category : #initialization }
ClapCommand >> initialize [
	super initialize.
	subcommands := OrderedCollection new.
	flags := OrderedCollection new.
]

{ #category : #matching }
ClapCommand >> matchCanonicalName: aStream [
	^ aStream peek = self canonicalName
	
]

{ #category : #accessing }
ClapCommand >> matchClass [
	^ ClapCommandMatch
]

{ #category : #accessing }
ClapCommand >> parameters [
	^ ClapAlternative new
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals)
]

{ #category : #doc }
ClapCommand >> print: category elementsOf: args [
	args size > 0
		ifTrue: [ Stdio stdout
				<< category;
				lf.
			args
				do: [ :a | 
					Stdio stdout
						<< a docName;<< '    ';<< a description;
						lf ].
			Stdio stdout lf ]
]

{ #category : #doc }
ClapCommand >> printUsage: aString [
	| s |
	s := aString , self canonicalName , ' '.
	flags do: [ :f | s := s , f docName , ' ' ].
	positionals do: [ :p | s := s , p docName , ' ' ].
	subcommands do: [ :sc | sc printUsage: s ].
	subcommands size = 0
		ifTrue: [ Stdio stdout
				<< s;
				lf ]
]

{ #category : #private }
ClapCommand >> stopMatching [
	^ self mismatch
]

{ #category : #accessing }
ClapCommand >> subcommandNamed: specName ifNone: aBlock [
	^ subcommands
		detect: [ :cmd | cmd canonicalName = specName ]
		ifNone: aBlock
]
