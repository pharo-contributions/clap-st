"
I represent the successful match of a (sub)command, and its arguments if any.
"
Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapParameterizedMatch,
	#instVars : [
		'leftovers'
	],
	#category : #'Clap-Core-Matches'
}

{ #category : #matching }
ClapCommandMatch >> concludeMatchOn: aStream [
	^ specification with: self matchOn: aStream
]

{ #category : #accessing }
ClapCommandMatch >> flags [
	^ arguments select: [ :each | specification flags includes: each specification ]
]

{ #category : #testing }
ClapCommandMatch >> isValid [
	^ leftovers isEmptyOrNil
		and: [ self matchedSubcommand isValid ]
]

{ #category : #accesing }
ClapCommandMatch >> leftovers: words [
	leftovers := words
]

{ #category : #accessing }
ClapCommandMatch >> matchedSubcommand [
	^ arguments
		detect: [ :any | specification subcommands includes: any specification ]
		ifFound: [ :sub | sub matchedSubcommand ]
		ifNone: [ self ]
]

{ #category : #accessing }
ClapCommandMatch >> unboundFlags [
	^ self unboundParametersAmong: specification flags
]

{ #category : #accessing }
ClapCommandMatch >> unboundParameters [
	^ self matchedSubcommand
		ifNotNil: [ self notYetImplemented ]
		ifNil: [ self unboundFlags , self unboundPositionals , self unboundSubcommands ]
]

{ #category : #accessing }
ClapCommandMatch >> unboundSubcommands [
	^ self unboundParametersAmong: specification subcommands
]

{ #category : #evaluating }
ClapCommandMatch >> value: arg [
	^ self matchedSubcommand evaluateMeaning: arg
]
