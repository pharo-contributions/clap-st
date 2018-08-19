Class {
	#name : #ClapValidationDiagnostic,
	#superclass : #Object,
	#instVars : [
		'subject',
		'description'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'as yet unclassified' }
ClapValidationDiagnostic class >> subject: aMatch description: aString [
	^ self new
		subject: aMatch;
		description: aString;
		yourself
]

{ #category : #accessing }
ClapValidationDiagnostic >> description: aString [
	description := aString
]

{ #category : #testing }
ClapValidationDiagnostic >> isFailure [
	^ true
]

{ #category : #testing }
ClapValidationDiagnostic >> isSuccess [
	^ false
]

{ #category : #printing }
ClapValidationDiagnostic >> printOn: aStream [
	aStream nextPutAll: description
]

{ #category : #accessing }
ClapValidationDiagnostic >> subject: aMatch [
	subject := aMatch
]
