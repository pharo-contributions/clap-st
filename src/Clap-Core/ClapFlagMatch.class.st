Class {
	#name : #ClapFlagMatch,
	#superclass : #ClapParameterizedMatch,
	#instVars : [
		'alias'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapFlagMatch class >> of: aFlag withAlias: usedAlias [ 
	^ self new
		specification: aFlag
		alias: usedAlias
]

{ #category : #accessing }
ClapFlagMatch >> alias [
	^ alias
]

{ #category : #initialization }
ClapFlagMatch >> specification: aFlag alias: aString [ 
	specification := aFlag.
	alias := aString
]
