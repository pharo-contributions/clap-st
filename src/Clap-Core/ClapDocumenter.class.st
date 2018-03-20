Class {
	#name : #ClapDocumenter,
	#superclass : #Object,
	#instVars : [
		'formatter'
	],
	#category : #'Clap-Core-Documentation'
}

{ #category : #'instance creation' }
ClapDocumenter class >> new [
	^ self on: (ClapDocumentationFormatter on: String new writeStream)
]

{ #category : #'instance creation' }
ClapDocumenter class >> on: aFormatter [
	^ self basicNew
		initializeOn: aFormatter
]

{ #category : #accessing }
ClapDocumenter >> contents [
	^ formatter contents
]

{ #category : #documenting }
ClapDocumenter >> descriptionSummary: aCommand [
	formatter
		text: aCommand description;
		newLine
]

{ #category : #documenting }
ClapDocumenter >> explain: aCommand [
	self descriptionSummary: aCommand.
	formatter newLine.
	self usage: aCommand
]

{ #category : #initialization }
ClapDocumenter >> initializeOn: aFormatter [
	self initialize.
	formatter := aFormatter
]

{ #category : #documenting }
ClapDocumenter >> usage: aCommand [
	formatter
		text: 'Usage: ';
		text: aCommand canonicalName.
	aCommand flags
		ifNotEmpty: [ :flags | 
			formatter space; text: '['.
			flags
				do: [ :each | formatter text: '--'; text: each canonicalName ]
				separatedBy: [ formatter text: ',' ].
			formatter text: ']' ].
	aCommand positionals
		ifNotEmpty: [ :positionals | 
			formatter space; text: '['.
			positionals
				do: [ :each |
					formatter
						text: '<';
						text: each canonicalName;
						text: '>' ]
				separatedBy: [ formatter space ].
			formatter text: ']' ].
	formatter newLine
]
