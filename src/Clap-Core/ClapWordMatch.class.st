"
I am a leaf match, covering a single word of the argument sequence.
"
Class {
	#name : #ClapWordMatch,
	#superclass : #ClapExplicit,
	#instVars : [
		'word'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #parsing }
ClapWordMatch >> addArgumentTo: aClapContext [ 
	self specification addCommandArg: self word in: aClapContext
]

{ #category : #matching }
ClapWordMatch >> completeMatchOn: aStream [
	word := aStream next.
	startIndex := aStream position.
	self addArgumentTo: self context.
]

{ #category : #testing }
ClapWordMatch >> isValid: aValidation [

	^ aValidation isValidWordMatch: self
]

{ #category : #accessing }
ClapWordMatch >> stop [
	^ self start
]

{ #category : #accessing }
ClapWordMatch >> value [
	^ self word
	"^ self value: nil"
]

{ #category : #accessing }
ClapWordMatch >> word [
	^ word
]
