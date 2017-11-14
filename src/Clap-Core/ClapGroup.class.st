Class {
	#name : #ClapGroup,
	#superclass : #Object,
	#instVars : [
		'groupName',
		'parameters'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #'instance creation' }
ClapGroup class >> new: aString [
	^ self new;name: aString
]

{ #category : #doc }
ClapGroup >> doc [
	Stdio stdout
		<< groupName;
		lf.
	Stdio stdout
		<< ':';
		lf;
		crlf.
	parameters do: [ :p | p doc.Stdio stdout crlf ]
]

{ #category : #setting }
ClapGroup >> name: aString [
	groupName := aString
]
