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

{ #category : #initialization }
ClapCommand >> initialize [
	super initialize.
	subcommands := OrderedCollection new.
	flags := OrderedCollection new
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
	args := ClapAlternative new
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals).

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) recordIn: match ].

	^ match

]

{ #category : #accessing }
ClapCommand >> subcommandNamed: specName ifNone: aBlock [
	^ subcommands
		detect: [ :cmd | cmd canonicalName = specName ]
		ifNone: aBlock
]
