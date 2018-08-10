"
My instances represent formal parameters in command-line invocations.

My subclasses implement the various conventional kinds of command-line parameters, and their instances are composed to specify the syntax of a given command.
"
Class {
	#name : #ClapParameter,
	#superclass : #Object,
	#instVars : [
		'canonicalName',
		'description',
		'multiple',
		'meaningBlock',
		'defaultMeaningBlock'
	],
	#category : #'Clap-Core-Specifications'
}

{ #category : #evaluating }
ClapParameter class >> basicMeaning [
	^ [ :match | match ]
]

{ #category : #'instance creation' }
ClapParameter class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #adding }
ClapParameter >> addTo: parentParameter [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapParameter >> basicMeaning [
	^ self class basicMeaning
]

{ #category : #'matching - testing' }
ClapParameter >> canMatchAt: aStream [
	^ aStream atEnd not
		and: [ self canMatchWith: aStream peek ]
]

{ #category : #'matching - testing' }
ClapParameter >> canMatchExtending: aParameterizedMatch [
	^ aParameterizedMatch
		at: self
		ifFound: [ self isMultiple ]
		ifAbsent: [ true ]
]

{ #category : #'matching - testing' }
ClapParameter >> canMatchWith: word [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClapParameter >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapParameter >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #accessing }
ClapParameter >> defaultMeaning [
	^ defaultMeaningBlock
]

{ #category : #initialization }
ClapParameter >> defaultMeaning: aBlock [
	defaultMeaningBlock := aBlock
]

{ #category : #accessing }
ClapParameter >> description [
	^ description
]

{ #category : #initialization }
ClapParameter >> description: aString [
	description := aString
]

{ #category : #initialization }
ClapParameter >> initialize [
	description := ''.
	multiple := false.
	meaningBlock := self basicMeaning.
	defaultMeaningBlock := meaningBlock
]

{ #category : #testing }
ClapParameter >> isMultiple [
	^ multiple
]

{ #category : #matching }
ClapParameter >> match: aStreamOrSequenceable [
	^ self matchOn: aStreamOrSequenceable readStream
]

{ #category : #accessing }
ClapParameter >> matchClass [
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> matchOn: aStream [
	^ (self newMatchAt: aStream)
		completeMatchOn: aStream;
		yourself
]

{ #category : #accessing }
ClapParameter >> meaning [
	^ meaningBlock
]

{ #category : #initialization }
ClapParameter >> meaning: aBlock [
	meaningBlock := aBlock
]

{ #category : #initialization }
ClapParameter >> multiple: aBoolean [
	multiple := aBoolean
]

{ #category : #matching }
ClapParameter >> newMatchAt: aStream [
	^ ((self canMatchAt: aStream)
				ifTrue: [ self matchClass ]
				ifFalse: [ ClapMismatch ])
			specification: self
]

{ #category : #printing }
ClapParameter >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self canonicalName;
		nextPut: $)
]

{ #category : #documenting }
ClapParameter >> synopsis [
	^ String streamContents: [ :aStream | self synopsisOn: aStream ]
]

{ #category : #documenting }
ClapParameter >> synopsisOn: aStream [
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> with: partialMatch matchWordOn: aStream [
	partialMatch rawWord: aStream next
]
