Class {
	#name : #UT8Flag,
	#superclass : #ClapFlag,
	#category : 'Clap-Core-Main-Exemple'
}

{ #category : #'instance creation' }
UT8Flag class >> create [
	^ self withName: 'UTF8'	
]

{ #category : #doc }
UT8Flag >> description [
	^ 'Prints at UTF8 format'
]
