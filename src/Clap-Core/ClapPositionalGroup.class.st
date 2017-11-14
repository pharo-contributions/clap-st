Class {
	#name : #ClapPositionalGroup,
	#superclass : #ClapCategory,
	#instVars : [
		'positional'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapPositionalGroup >> check: aPos [
	^ aPos isPositional 
]

{ #category : #doc }
ClapPositionalGroup >> doc [
	Stdio stdout << name.
	Stdio stdout << ':';lf;crlf.
	Stdio stdout << positional description;lf
]

{ #category : #accessing }
ClapPositionalGroup >> name [
	^ '<' , name , '>'
]

{ #category : #setting }
ClapPositionalGroup >> put: aPos [
	(self check: aPos) ifFalse: [ ^ 0 ].
	positional := aPos
]
