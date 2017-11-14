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
			Stdio stdout
				<< ' ';
				lf ].
	Stdio stdout
		<< '';
		crlf
]

{ #category : #initialization }
ClapPattern >> initialize [
	groupList := OrderedCollection new
]
