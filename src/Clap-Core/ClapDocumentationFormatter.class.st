Class {
	#name : #ClapDocumentationFormatter,
	#superclass : #Object,
	#instVars : [
		'stream',
		'newLineString'
	],
	#category : #'Clap-Core-Documentation'
}

{ #category : #'instance creation' }
ClapDocumentationFormatter class >> on: aStream [
	^ self basicNew
		initializeOn: aStream
]

{ #category : #accessing }
ClapDocumentationFormatter >> columnIndent [
	^ 16
]

{ #category : #accessing }
ClapDocumentationFormatter >> columnSeparation [
	^ 3
]

{ #category : #accessing }
ClapDocumentationFormatter >> contents [
	^ stream contents
]

{ #category : #initialization }
ClapDocumentationFormatter >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #accessing }
ClapDocumentationFormatter >> listIndent [
	^ 4
]

{ #category : #formattting }
ClapDocumentationFormatter >> newLine [
	^ stream nextPutAll: self newLineString
]

{ #category : #accessing }
ClapDocumentationFormatter >> newLineString [
	^ newLineString ifNil: [ OSPlatform current lineEnding ]
]

{ #category : #accessing }
ClapDocumentationFormatter >> newLineString: aString [
	newLineString := aString
]

{ #category : #formattting }
ClapDocumentationFormatter >> section: titleString with: contentsBlock [
	| contents |
	contents := self class new.
	contentsBlock value: contents.
	
	contents isEmpty ifFalse: [
		stream
			nextPutAll: titleString; nextPut: $:;
			newLine;
			nextPutAll: contents contents ]
]

{ #category : #accessing }
ClapDocumentationFormatter >> space [
	^ stream space
]

{ #category : #formattting }
ClapDocumentationFormatter >> tabularize: associations [
	associations do: [ :each |
		| keyWidth |
		keyWidth := each key size + self listIndent.
		stream
			space: self listIndent;
			nextPutAll: each key.
		keyWidth + self columnSeparation > self columnIndent
			ifTrue: [ self newLine. stream space: self columnIndent ]
			ifFalse: [ stream space: self columnIndent - keyWidth ].
		stream nextPutAll: each value.
		self newLine ]
]

{ #category : #formattting }
ClapDocumentationFormatter >> text: aString [
	stream nextPutAll: aString
]
