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
		'flags',
		'subcommands'
	],
	#category : #'Clap-Core-Parameters'
}

{ #category : #doc }
ClapCommand >> accept: aVisitor [
	^ aVisitor visitCommand: self
]

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

{ #category : #accessing }
ClapCommand >> flags [
	^ flags
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
ClapCommand >> subcommandNamed: specName ifNone: aBlock [
	^ subcommands
		detect: [ :cmd | cmd canonicalName = specName ]
		ifNone: aBlock
]

{ #category : #accessing }
ClapCommand >> subcommands [
	^ subcommands
]

{ #category : #matching }
ClapCommand >> with: partialMatch detectMatchOn: aStream ifFound: foundBlock ifNone: noneBlock [
	^ self
		with: partialMatch detect: flags matchOn: aStream
		ifFound: foundBlock ifNone: [
			super
				with: partialMatch detectMatchOn: aStream
				ifFound: foundBlock ifNone: [
					self
						with: partialMatch detect: subcommands matchOn: aStream
						ifFound: foundBlock ifNone: noneBlock ] ]
]

{ #category : #matching }
ClapCommand >> with: partialMatch matchOn: aStream [
	| result |
	result := super with: partialMatch matchOn: aStream.
	aStream atEnd ifFalse: [ ^ self mismatch ].
	
	^ result
]
