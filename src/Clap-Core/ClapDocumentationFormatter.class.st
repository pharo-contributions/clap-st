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
ClapDocumentationFormatter >> contents [
	^ stream contents
]

{ #category : #initialization }
ClapDocumentationFormatter >> initializeOn: aStream [
	self initialize.
	stream := aStream
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
	| termWidth |
	termWidth := associations inject: 0 into: [ :width :each | width max: each size ].
	associations do: [ :each |
		stream
			nextPutAll: each key;
			space: termWidth - each key size + 2;
			nextPutAll: each value;
			newLine ]
]

{ #category : #formattting }
ClapDocumentationFormatter >> text: aString [
	stream nextPutAll: aString
]
