Class {
	#name : #ClapGroup,
	#superclass : #ClapCategory,
	#instVars : [
		'parameters'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapGroup >> doc [
	Stdio stdout << name asUppercase.
			Stdio stdout
				<< ':';
				lf;
				crlf.
	parameters
		do: [ :p | 
			Stdio stdout << p docName.
			Stdio stdout << '    '.
			Stdio stdout
				<< p description;
				lf;
				crlf ]
]

{ #category : #initialization }
ClapGroup >> initialize [
	super initialize.
	parameters := OrderedCollection new
]

{ #category : #setting }
ClapGroup >> put: aParameter [
	(self check: aParameter) ifFalse: [ ^ 0 ].
	parameters add: aParameter 
]
