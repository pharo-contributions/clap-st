Class {
	#name : #ClapValidationDiagnostic,
	#superclass : #Object,
	#instVars : [
		'validation',
		'subject',
		'success'
	],
	#category : #'Clap-Core-Validation'
}

{ #category : #'instance creation' }
ClapValidationDiagnostic class >> of: aValidation subject: aMatch [
	^ self new
		validation: aValidation subject: aMatch;
		yourself
]

{ #category : #testing }
ClapValidationDiagnostic >> isFailure [
	^ success not
]

{ #category : #testing }
ClapValidationDiagnostic >> isSuccess [
	^ success
]

{ #category : #printing }
ClapValidationDiagnostic >> printOn: aStream [
	aStream nextPutAll: validation description
]

{ #category : #initialization }
ClapValidationDiagnostic >> validation: aValidation subject: anExpression [
	validation := aValidation.
	subject := anExpression.
	success := validation matches: subject

]
