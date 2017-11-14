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
	stream
		nextPutAll: aString
]

{ #category : #doc }
ClapDocWriter >> generateDoc: aCommand [
	| categories args |
	categories := #('OPTIONS:' 'ARGS:' 'COMMANDS:').
	args := self takeArgs: aCommand.
	self addToStream: 'USAGE:' , String cr.
	self printUsage: '' of: aCommand.
	categories do: [ :c | self printCategory: c of: (args at: (categories indexOf: c)).
		 ]
]

{ #category : #doc }
ClapDocWriter >> printCategory: aString of: args [
	args size = 0
		ifFalse: [ self addToStream: String cr , aString , String cr.
			args do: [ :a | self addToStream: (a accept: self) , String tab , a description , String cr ] ]
]

{ #category : #doc }
ClapDocWriter >> printCommand: aCommand [
	^ aCommand canonicalName , ' '
]

{ #category : #doc }
ClapDocWriter >> printFlag: aFlag [
	| s |
	s := aFlag longForm , ',' , aFlag shortForm , ' '.
	aFlag positionals do: [ :p | s := s , (p accept: self) ].
	^ s
]

{ #category : #doc }
ClapDocWriter >> printPositional: aPositional [
	^ '<' , aPositional canonicalName , '> '
]

{ #category : #doc }
ClapDocWriter >> printUsage: aString of: aCommand [
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

{ #category : #private }
ClapDocWriter >> takeArgs: aCommand [
	| c |
	c := OrderedCollection new.
	c add: aCommand flags; add: aCommand positionals; add: aCommand subcommands.
	^ c
]
