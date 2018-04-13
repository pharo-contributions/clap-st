"
I represent a flag.

Flags can appear in any order in the input and are recognized by their form, starting with dashes (e.g. `--foo` in long form or `-f` in short form).
"
Class {
	#name : #ClapFlag,
	#superclass : #ClapParameterized,
	#category : 'Clap-Core-Parameters'
}

{ #category : #evaluating }
ClapFlag class >> basicMeaning [
	^ #isExplicit
]

{ #category : #'as yet unclassified' }
ClapFlag class >> helpFlag [
	^ (self withName: 'help')
		description: 'Prints documentation about the parent command.'
]

{ #category : #doc }
ClapFlag >> accept: aVisitor [
	^ aVisitor visitFlag: self
]

{ #category : #accessing }
ClapFlag >> longForm [
	^ '--' , self canonicalName
]

{ #category : #matching }
ClapFlag >> matchCanonicalName: aStream [
	| word |
	word := aStream peek.
	^ word = self longForm or: word = self shortForm
]

{ #category : #accessing }
ClapFlag >> matchClass [
	^ ClapFlagMatch
]

{ #category : #initialization }
ClapFlag >> meaningCollection [
	self meaning: [ :match | match positionalValues ]
]

{ #category : #initialization }
ClapFlag >> meaningScalar [
	"Should only be allowed when there's a single positional"
	self meaning: [ :match | (match at: self positionals first) value ]
]

{ #category : #accessing }
ClapFlag >> shortForm [
	^ '-' , self shortName
]

{ #category : #accessing }
ClapFlag >> shortName [
	^ self canonicalName copyFrom: 1 to: 1
]

{ #category : #documenting }
ClapFlag >> synopsisOn: aStream [
	aStream
		nextPutAll: '--';
		nextPutAll: self canonicalName
]
