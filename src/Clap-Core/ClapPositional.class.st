"
I represent a free-form parameter which is passed as a single shell word and recognized based on its position in the input.

"
Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : #'Clap-Core-Specifications'
}

{ #category : #evaluating }
ClapPositional class >> basicMeaning [
	^ [ :match | match word ]
]

{ #category : #adding }
ClapPositional >> addTo: parentParameter [
	^ parentParameter addPositional: self
]

{ #category : #matching }
ClapPositional >> canMatchWith: word [
	^ (word beginsWith: '-') not
]

{ #category : #accessing }
ClapPositional >> matchClass [
	^ ClapPositionalMatch
]

{ #category : #documenting }
ClapPositional >> synopsisOn: aStream [
	^ aStream
			nextPut: $<;
			nextPutAll: self canonicalName;
			nextPut: $>
]
