"
I represent a flag.

Flags can appear in any order in the input and are recognized by their form, starting with dashes (e.g. `--foo` in long form or `-f` in short form).
"
Class {
	#name : #ClapFlag,
	#superclass : #ClapParameterized,
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapFlag >> accept: aVisitor [
	^ aVisitor visitFlag: self
]

{ #category : #evaluating }
ClapFlag >> defaultMeaningOf: aMatch [
	^ aMatch isMismatch not
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

{ #category : #accessing }
ClapFlag >> parameters [
	^ ClapQueue withAll: positionals
]

{ #category : #accessing }
ClapFlag >> shortForm [
	^ '-' , self shortName
]

{ #category : #accessing }
ClapFlag >> shortName [
	^ self canonicalName copyFrom: 1 to: 1
]
