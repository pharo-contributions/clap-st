Class {
	#name : #ClapCommand,
	#superclass : #ClapParameterized,
	#instVars : [
		'subcommands',
		'flags'
	],
	#category : 'Clap-Core'
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
	subcommands := OrderedCollection new.
	flags := OrderedCollection new
]

{ #category : #matching }
ClapCommand >> matchOn: aStream [
	^ aStream peek = self canonicalName
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			positionals do: [ :each | (each matchOn: aStream) addTo: match ].
			match ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapCommand >> matchWithAlias: aString [ 
	^ ClapCommandMatch of: self withAlias: aString
]
