Class {
	#name : #ClapFlagMatch,
	#superclass : #Object,
	#instVars : [
		'flag',
		'alias'
	],
	#category : 'Clap-Tests-Scratch'
}

{ #category : #'instance creation' }
ClapFlagMatch class >> of: aFlag withAlias: usedAlias [ 
	^ self new
		flag: aFlag
		alias: usedAlias
]

{ #category : #accessing }
ClapFlagMatch >> alias [
	^ alias
]

{ #category : #initialization }
ClapFlagMatch >> flag: aFlag alias: aString [ 
	flag := aFlag.
	alias := aString
]

{ #category : #testing }
ClapFlagMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapFlagMatch >> specification [
	^ flag
]
