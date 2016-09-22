Class {
	#name : #ClapCommand,
	#superclass : #ClapParameterized,
	#instVars : [
		'subcommands',
		'flags'
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

{ #category : #initialization }
ClapCommand >> initialize [
	super initialize.
	subcommands := ClapAlternative new.
	flags := ClapAlternative new
]

{ #category : #accessing }
ClapCommand >> matchClass [
	^ ClapCommandMatch
]

{ #category : #matching }
ClapCommand >> matchOn: aStream [
	| match args |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWord: aStream next.
	self flag: 'FIXME: should build whole alternative/queues for this matching only'.
	args := ClapAlternative new
		add: flags;
		add: subcommands;
		add: positionals.

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) addTo: match ].

	^ match

]
