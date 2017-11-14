Class {
	#name : #LogFile,
	#superclass : #ClapPositional,
	#category : 'Clap-Core-Main-Exemple'
}

{ #category : #'instance creation' }
LogFile class >> create [
	^ self withName: 'logFile'
]

{ #category : #doc }
LogFile >> description [
	^ 'The log file to put as parameter'
]
