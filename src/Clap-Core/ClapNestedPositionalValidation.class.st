"
I validate that a nested positional, i.e. a positional preceded by a flag is correct:
- there is no positional found in the command line but a default value was specified,
- or there is a positional found after the flag.
"
Class {
	#name : #ClapNestedPositionalValidation,
	#superclass : #ClapValidation,
	#instVars : [
		'missing'
	],
	#category : #'Clap-Core-Validation'
}

{ #category : #accessing }
ClapNestedPositionalValidation >> description [
	^ 'Missing positional value for ', (', ' join: self missingValueIdentifiers)
]

{ #category : #validation }
ClapNestedPositionalValidation >> failureDescriptionFor: anObject [
	^ self description
]

{ #category : #testing }
ClapNestedPositionalValidation >> matches: aClapContext [

	| specifiedFlags |
	
	aClapContext isMismatch ifTrue: [ ^ true "cannot validate" ].
	
	specifiedFlags := aClapContext match flags.
	missing := specifiedFlags 
		select: [ :match | match positionalValues includes: nil ].
	^ missing isEmpty

]

{ #category : #accessing }
ClapNestedPositionalValidation >> missingValueIdentifiers [

	^ missing flatCollect: [ :match | 
		  match specification positionals collect: [ :positional | positional identifier ] ]
]
