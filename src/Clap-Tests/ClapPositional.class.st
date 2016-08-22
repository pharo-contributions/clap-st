Class {
	#name : #ClapPositional,
	#superclass : #Object,
	#instVars : [
		'canonicalName',
		'defaultValue'
	],
	#category : 'Clap-Tests'
}

{ #category : #'as yet unclassified' }
ClapPositional class >> withName: aString [ 
	^ self new
		canonicalName: aString;
		yourself
]

{ #category : #matching }
ClapPositional >> absent [
	^ defaultValue
		ifNil: [ self mismatch ]
		ifNotNil: [ ClapPositionalMatch of: self value: defaultValue ]
]

{ #category : #accessing }
ClapPositional >> canonicalName [
	^ canonicalName
]

{ #category : #initialization }
ClapPositional >> canonicalName: aString [ 
	canonicalName := aString
]

{ #category : #accessing }
ClapPositional >> default: aValue [
	defaultValue := aValue
]

{ #category : #matching }
ClapPositional >> matchOn: aStream [
	^ aStream atEnd
		ifTrue: [ self absent ]
		ifFalse: [ ClapPositionalMatch of: self value: aStream next ]
]
