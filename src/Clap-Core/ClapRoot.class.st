"
I represent a nameless command, serving as the root of the command hierarchy and providing default behavior and error handling.
My subcommands are effectively the main commands available to the user.
"
Class {
	#name : #ClapRoot,
	#superclass : #ClapCommand,
	#category : #'Clap-Core-Specification'
}

{ #category : #'matching - testing' }
ClapRoot >> canMatchWith: word [
	^ true
]

{ #category : #accessing }
ClapRoot >> matchClass [
	^ ClapRootMatch
]

{ #category : #matching }
ClapRoot >> with: partialMatch matchWordOn: aStream [
	"Do nothing, as this always matches without consuming anything"
	^ partialMatch
]
