Class {
	#name : #ClapCommandGroup,
	#superclass : #ClapGroup,
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapCommandGroup >> check: aParameter [
	^ aParameter isCommand
]
