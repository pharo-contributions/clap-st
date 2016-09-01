Class {
	#name : #ClapPositional,
	#superclass : #ClapParameter,
	#category : 'Clap-Core'
}

{ #category : #matching }
ClapPositional >> matchOn: aStream [
	^ aStream atEnd
		ifTrue: [ self mismatch ]
		ifFalse: [ ClapPositionalMatch of: self value: aStream next ]
]
