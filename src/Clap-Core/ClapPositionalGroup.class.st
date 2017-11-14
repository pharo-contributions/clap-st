Class {
	#name : #ClapPositionalGroup,
	#superclass : #ClapCategory,
	#instVars : [
		'positional'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapPositionalGroup >> doc [
	Stdio stdout << positional description
]
