Class {
	#name : #STONFlag,
	#superclass : #ClapFlag,
	#category : 'Clap-Core-Main-Exemple'
}

{ #category : #'instance creation' }
STONFlag class >> create [
	^ self withName: 'STON'
]

{ #category : #doc }
STONFlag >> description [
	^ 'Prints at STON format'
]
