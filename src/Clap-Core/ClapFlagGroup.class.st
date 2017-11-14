Class {
	#name : #ClapFlagGroup,
	#superclass : #ClapGroup,
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapFlagGroup >> check: aParameter [
	^ aParameter isFlag
]
