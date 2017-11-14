Class {
	#name : #ClapPattern,
	#superclass : #Object,
	#instVars : [
		'groupList'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapPattern >> doc [
	groupList
		do: [ :g | 
			g doc.
			Stdio stdout << ' ' ].
	Stdio stdout
		<< '';lf;
		crlf
]

{ #category : #initialization }
ClapPattern >> initialize [
	groupList := OrderedCollection new
]
