"
I represent a class using the DP Visitor in order to generate command doc
"
Class {
	#name : #ClapDocWriter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'newLineString'
	],
	#category : #'Clap-Core-Documentation'
}

{ #category : #'instance creation' }
ClapDocWriter class >> new [
	^ self on: String new writeStream
]

{ #category : #'instance creation' }
ClapDocWriter class >> on: aFormatter [
	^ self basicNew
		initializeOn: aFormatter
]

{ #category : #accessing }
ClapDocWriter >> contents [
	^ stream contents
]

{ #category : #'old - generating' }
ClapDocWriter >> generateDoc: aCommand [
	self
		nextPutAll: 'USAGE:';
	 	newLine.
	self
		printUsage: '' of: aCommand;
		printOptions: aCommand;
		printArgs: aCommand;
		printCommands: aCommand
]

{ #category : #initialization }
ClapDocWriter >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #printing }
ClapDocWriter >> newLine [
	^ self nextPutAll: self newLineString
]

{ #category : #accessing }
ClapDocWriter >> newLineString [
	^ newLineString ifNil: [ OSPlatform current lineEnding ]
]

{ #category : #accessing }
ClapDocWriter >> newLineString: aString [
	newLineString := aString
]

{ #category : #printing }
ClapDocWriter >> nextPut: aCharacter [
	^ stream nextPut: aCharacter
]

{ #category : #printing }
ClapDocWriter >> nextPutAll: aString [
	^ stream nextPutAll: aString
]

{ #category : #'old - generating' }
ClapDocWriter >> printArgs: aCommand [
	"Prints the list of positionals"
	self printCategory: 'ARGS:' with: aCommand positionals
]

{ #category : #'old - generating' }
ClapDocWriter >> printCategory: aString with: args [
	"A generic method to print a list of args according to the type"
	args ifEmpty: [ ^ self ].

	self newLine;
		nextPutAll: aString;
		newLine.
	
	args do: [ :a |
		self
			nextPutAll: (a accept: self);
			tab;
		 	nextPutAll: a description;
			newLine ]
]

{ #category : #'old - generating' }
ClapDocWriter >> printCommand: aCommand [
	"Returns the command name to print it"
	^ aCommand canonicalName , ' '
]

{ #category : #'old - generating' }
ClapDocWriter >> printCommands: aCommand [
	"Prints the list of subcommands"
	self printCategory: 'COMMANDS:' with: aCommand subcommands
]

{ #category : #'old - generating' }
ClapDocWriter >> printFlag: aFlag [
	"Returns the flag name formatting to print it in the doc"
	| s |
	s := aFlag longForm , ',' , aFlag shortForm , ' '.
	aFlag positionals do: [ :p | s := s , (p accept: self) ].
	^ s
]

{ #category : #'old - generating' }
ClapDocWriter >> printOptions: aCommand [
	"Prints the list of flags"
	self printCategory: 'OPTIONS:' with: aCommand flags
]

{ #category : #'old - generating' }
ClapDocWriter >> printPositional: aPositional [
	"Returns the positional name formatting to print it in the doc"
	^ '<' , aPositional canonicalName , '> '
]

{ #category : #'old - generating' }
ClapDocWriter >> printUsage: aString of: aCommand [
	"Prints the usage category, i.e all the possible syntaxes"

	| aux |
	aux := aCommand accept: self.
	aCommand flags do: [ :f | aux := aux , (f accept: self) ].
	aCommand positionals do: [ :p | aux := aux , (p accept: self) ].
	aCommand subcommands do: [ :sc | self printUsage: aString , aux of: sc ].
	aCommand subcommands ifEmpty: [
		self
			nextPutAll: aString;
		 	nextPutAll: aux;
			newLine ]
]

{ #category : #documenting }
ClapDocWriter >> section: titleString with: aBlock [
	self
		nextPutAll: titleString;
		nextPut: $:;
		newLine.
	aBlock value
]

{ #category : #accessing }
ClapDocWriter >> stream [
	^ stream
]

{ #category : #printing }
ClapDocWriter >> tab [
	^ stream tab
]

{ #category : #'old - visiting' }
ClapDocWriter >> visitCommand: aCommand [
	^ self printCommand: aCommand
]

{ #category : #'old - visiting' }
ClapDocWriter >> visitFlag: aCommand [
	^ self printFlag: aCommand
]

{ #category : #'old - visiting' }
ClapDocWriter >> visitPositional: aCommand [
	^ self printPositional: aCommand
]
