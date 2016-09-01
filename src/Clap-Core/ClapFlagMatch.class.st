Class {
	#name : #ClapFlagMatch,
	#superclass : #Object,
	#instVars : [
		'specification',
		'alias'
	],
	#category : 'Clap-Core'
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

{ #category : #testing }
ClapFlagMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapFlagMatch >> specification [
	^ specification
]

{ #category : #initialization }
ClapFlagMatch >> specification: aFlag alias: aString [ 
	specification := aFlag.
	alias := aString
]
