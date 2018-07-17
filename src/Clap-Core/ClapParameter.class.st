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
	meaningBlock := self class basicMeaning.
	defaultMeaningBlock := meaningBlock
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
	| premise |
	premise := self matchPremiseOn: aStream.
	^ premise
		ifMatch: [ self with: premise matchOn: aStream ]
]

{ #category : #matching }
ClapParameter >> matchPremiseOn: aStream [ 
	^ self subclassResponsibility
]

{ #category : #matching }
ClapParameter >> matchWord: aString [
	^ self matchClass
		of: self
		with: aString
]

{ #category : #accessing }
ClapParameter >> meaning [
	^ meaningBlock
]

{ #category : #initialization }
ClapParameter >> meaning: aBlock [
	meaningBlock := aBlock
]

{ #category : #matching }
ClapParameter >> mismatch [
	^ ClapMismatch specification: self
]

{ #category : #matching }
ClapParameter >> mismatchWord: aString [
	^ ClapMismatch of: self with: aString
]

{ #category : #matching }
ClapParameter >> newMatchAt: aStream [
	^ self matchClass
		of: self
		with: aStream next
]

{ #category : #matching }
ClapParameter >> newMismatchAt: aStream [
	^ ClapMismatch
		of: self
		with: aStream peek
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
ClapParameter >> with: premiseMatch matchOn: aStream [ 
	^ self subclassResponsibility
]
