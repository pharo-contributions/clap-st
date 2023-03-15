"
I am a match for a named composite parameter; I cover at least one word (corresponding to one of my specification's aliases).
"
Class {
	#name : #ClapNamedMatch,
	#superclass : #ClapCompositeMatch,
	#instVars : [
		'keyword'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #parsing }
ClapNamedMatch >> addArgumentTo: aClapContext [ 
	 self specification addCommandArg: self word in: aClapContext
]

{ #category : #matching }
ClapNamedMatch >> completeMatchOn: aStream [
	keyword := aStream next.
	startIndex := aStream position.
	self matchChildrenOn: aStream.
	self addArgumentTo: self context.
]

{ #category : #testing }
ClapNamedMatch >> isFullMatch [

	^ (self specification isFlag and: [ self specification hasPositional ])
		ifTrue: [ children size = self specification positionals size ]
		ifFalse: [ true ]
]

{ #category : #testing }
ClapNamedMatch >> isValid: aValidation [

	^ aValidation isValidNamedMatch: self
]

{ #category : #matching }
ClapNamedMatch >> word [
	^ keyword
]
