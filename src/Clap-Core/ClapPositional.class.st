"
I represent a free-form parameter which is passed as a single shell word and recognized based on its position in the input.

"
Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : #'Clap-Core-Specification'
}

{ #category : #evaluating }
ClapPositional class >> basicMeaning [
	^ [ :match | match word ]
]

{ #category : #computing }
ClapPositional class >> idFrom: aFlagId [

	^ aFlagId , '-value'
]

{ #category : #parsing }
ClapPositional >> addCommandArg: aString in: aClapContext [ 
	aClapContext addFlag: self identifier positional: aString multiple: self isMultiple
]

{ #category : #adding }
ClapPositional >> addTo: parentParameter [
	^ parentParameter addPositional: self
]

{ #category : #'matching - testing' }
ClapPositional >> canMatchWith: word [
	^ (word beginsWith: '-') not
]

{ #category : #api }
ClapPositional >> defaultValue: aBlock [
	self implicitMeaning: aBlock
]

{ #category : #accessing }
ClapPositional >> flagId [

	"positional of a flag has an id like xxx-value"
	^ self identifier copyUpToLast: $-
]

{ #category : #accessing }
ClapPositional >> matchClass [
	^ ClapWordMatch
]

{ #category : #types }
ClapPositional >> symbol [
	"tell that I must be converted as a symbol"
		
	self flag: 'TODO: convert as symbol'
]

{ #category : #documenting }
ClapPositional >> synopsisOn: aStream [
	^ aStream
			nextPut: $<;
			nextPutAll: self canonicalName;
			nextPut: $>
]
