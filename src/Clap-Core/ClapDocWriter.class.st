"
I represent a class using the DP Visitor in order to generate command doc
"
Class {
	#name : #ClapDocWriter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : 'Clap-Core-DocWriter'
}

{ #category : #'instance creation' }
ClapDocWriter class >> new: aStream [
	^ self new stream: aStream
]

{ #category : #adding }
ClapDocWriter >> addToStream: aString [
	stream nextPutAll: aString
]

{ #category : #doc }
ClapDocWriter >> generateDoc: aCommand [
	"The main method to generate doc"

	
	self addToStream: 'USAGE:' , String cr.
	self printUsage: '' of: aCommand.
	self printOptions: aCommand.
	self printArgs: aCommand.
	self printCommands: aCommand
]

{ #category : #doc }
ClapDocWriter >> printArgs: aCommand [
	"Prints the list of positionals"
	self printCategory: 'ARGS:' of: aCommand positionals
]

{ #category : #doc }
ClapDocWriter >> printCategory: aString of: args [
	"A generic method to print a list of args according to the type"
	args size = 0
		ifFalse: [ self addToStream: String cr , aString , String cr.
			args
				do: [ :a | self addToStream: (a accept: self) , String tab , a description , String cr ] ]
]

{ #category : #doc }
ClapDocWriter >> printCommand: aCommand [
	"Returns the command name to print it"
	^ aCommand canonicalName , ' '
]

{ #category : #doc }
ClapDocWriter >> printCommands: aCommand [
	"Prints the list of subcommands"
	self printCategory: 'COMMANDS:' of: aCommand subcommands
]

{ #category : #doc }
ClapDocWriter >> printFlag: aFlag [
	"Returns the flag name formatting to print it in the doc"
	| s |
	s := aFlag longForm , ',' , aFlag shortForm , ' '.
	aFlag positionals do: [ :p | s := s , (p accept: self) ].
	^ s
]

{ #category : #doc }
ClapDocWriter >> printOptions: aCommand [
	"Prints the list of flags"
	self printCategory: 'OPTIONS:' of: aCommand flags
]

{ #category : #doc }
ClapDocWriter >> printPositional: aPositional [
	"Returns the positional name formatting to print it in the doc"
	^ '<' , aPositional canonicalName , '> '
]

{ #category : #doc }
ClapDocWriter >> printUsage: aString of: aCommand [
	"Prints the usage category, i.e all the possible syntaxes"
	| aux |
	aux := aCommand accept: self.
	aCommand flags do: [ :f | aux := aux , (f accept: self) ].
	aCommand positionals do: [ :p | aux := aux , (p accept: self) ].
	aCommand subcommands do: [ :sc | self printUsage: aString , aux of: sc ].
	aCommand subcommands size = 0
		ifTrue: [ self addToStream: aString , aux , String cr ]
]

{ #category : #accessing }
ClapDocWriter >> stream [
	^ stream
]

{ #category : #setting }
ClapDocWriter >> stream: aStream [
	stream := aStream
]

{ #category : #visiting }
ClapDocWriter >> visitCommand: aCommand [
	^ self printCommand: aCommand
]

{ #category : #visiting }
ClapDocWriter >> visitFlag: aCommand [
	^ self printFlag: aCommand
]

{ #category : #visiting }
ClapDocWriter >> visitPositional: aCommand [
	^ self printPositional: aCommand
]
