Class {
	#name : #ClapPattern,
	#superclass : #Object,
	#instVars : [
		'groupList'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #adding }
ClapPattern >> add: aGroup [
	groupList add: aGroup
]

{ #category : #doc }
ClapPattern >> doc [
	groupList
		do: [ :g | 
			Stdio stdout << g docName.
			Stdio stdout << ' ' ].
	Stdio stdout
		<< '';
		lf;
		crlf
]

{ #category : #initialization }
ClapPattern >> initialize [
	groupList := OrderedCollection new
]
