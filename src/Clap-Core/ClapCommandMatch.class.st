"
I represent the successful match of a (sub)command, and its arguments if any.
"
Class {
	#name : #ClapCommandMatch,
	#superclass : #ClapParameterizedMatch,
	#category : 'Clap-Core-Matches'
}

{ #category : #parsing }
ClapCommandMatch >> matchedSubcommand [
	^ nil
]

{ #category : #parsing }
ClapCommandMatch >> unboundFlags [
	^ self unboundParametersAmong: specification flags
]

{ #category : #parsing }
ClapCommandMatch >> unboundParameters [
	^ self matchedSubcommand
		ifNotNil: [ self notYetImplemented ]
		ifNil: [ self unboundFlags , self unboundPositionals , self unboundSubcommands ]
]

{ #category : #parsing }
ClapCommandMatch >> unboundSubcommands [
	^ self unboundParametersAmong: specification subcommands
]
