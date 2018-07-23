"
I represent the successful match of a (sub)command, and its arguments if any.
"
Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapParameterizedMatch,
	#category : #'Clap-Core-Activation'
}

{ #category : #accessing }
ClapCommandMatch >> flags [
	^ arguments select: [ :each | specification flags includes: each specification ]
]

{ #category : #accessing }
ClapCommandMatch >> matchedSubcommand: foundBlock ifNone: noneBlock [
	^ arguments
		detect: [ :any | specification subcommands includes: any specification ]
		ifFound: [ :cmd | foundBlock cull: cmd ]
		ifNone: noneBlock
]

{ #category : #accessing }
ClapCommandMatch >> unboundFlags [
	^ self unboundParametersAmong: specification flags
]

{ #category : #accessing }
ClapCommandMatch >> unboundSubcommands [
	^ self unboundParametersAmong: specification subcommands
]

{ #category : #evaluating }
ClapCommandMatch >> value: arg [
	^ (self	matchedSubcommand: [ :sub | sub ] ifNone: [ self ])
		evaluateMeaning: arg
]
