Class {
	#name : #ClapGroup,
	#superclass : #Object,
	#instVars : [
		'parameters'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapGroup >> check: aParameter [
	^ self subclassResponsibility 
]

{ #category : #doc }
ClapGroup >> doc [
	parameters
		do: [ :p | 
			Stdio stdout << p docName.
			Stdio stdout << '    '.
			Stdio stdout << p description;lf;crlf ]
]

{ #category : #initialization }
ClapGroup >> initialize [
	super initialize
]

{ #category : #setting }
ClapGroup >> name: aString [
	groupName := aString
]

{ #category : #setting }
ClapGroup >> put: aParameter [
	(self check: aParameter) ifFalse: [ ^ 0 ].
	parameters add: aParameter 
]
