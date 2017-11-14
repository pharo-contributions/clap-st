Class {
	#name : #ClapOptional,
	#superclass : #Object,
	#instVars : [
		'parameter'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #doc }
ClapOptional >> docName [
	^ '[' , (parameter canonicalName) , ']'
]

{ #category : #setting }
ClapOptional >> parameter: aParameter [
	parameter := aParameter 
]
