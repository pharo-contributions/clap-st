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
	Stdio stdout << positional description
]

{ #category : #setting }
ClapPositionalGroup >> put: aPos [
	(self check: aPos) ifFalse: [ ^ 0 ].
	positional := aPos
]
