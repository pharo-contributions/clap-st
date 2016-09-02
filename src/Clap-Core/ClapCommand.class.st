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
	subcommands := OrderedCollection new.
	flags := OrderedCollection new
]

{ #category : #matching }
ClapCommand >> matchOn: aStream [
	^ aStream peek = self canonicalName
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			self matchOn: aStream flagsFor: match.
			self matchOn: aStream subcommandsFor: match.
			self matchOn: aStream positionalsFor: match.
			match ]
		ifFalse: [ self mismatch ]
]

{ #category : #matching }
ClapCommand >> matchOn: aStream flagsFor: aMatch [
	[ aStream atEnd ] whileFalse: [
		| matchingFlag |
		flags
			detect: [ :each |
				matchingFlag := each matchOn: aStream.
				matchingFlag isMismatch not ]
			ifFound: [ matchingFlag addTo: aMatch ]
			ifNone: [ ^ self ] ]
]

{ #category : #matching }
ClapCommand >> matchOn: aStream subcommandsFor: aMatch [
	"self notYetImplemented"
]

{ #category : #matching }
ClapCommand >> matchWithAlias: aString [ 
	^ ClapCommandMatch of: self withAlias: aString
]
