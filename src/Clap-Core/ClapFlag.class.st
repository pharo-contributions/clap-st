"
I represent a class which represent a flag which is accepted in a command.
"
Class {
	#name : #ClapFlag,
	#superclass : #ClapParameterized,
	#category : 'Clap-Core-Parameters'
}

{ #category : #evaluating }
ClapFlag >> defaultMeaningOf: aMatch [
	^ aMatch isMismatch not
]

{ #category : #accessing }
ClapFlag >> longForm [
	^ '--' , self canonicalName
]

{ #category : #accessing }
ClapFlag >> matchClass [
	^ ClapFlagMatch
]

{ #category : #matching }
ClapFlag >> matchOn: aStream [
	| word |
	word := aStream peek.
	^ (word = self shortForm or: [ word = self longForm ])
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]
]

{ #category : #accessing }
ClapFlag >> shortForm [
	^ '-' , self shortName
]

{ #category : #accessing }
ClapFlag >> shortName [
	^ self canonicalName copyFrom: 1 to: 1
]
