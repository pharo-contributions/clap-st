"
I pretty print an informative message explaining errors found according to the command specification.
"
Class {
	#name : #ClapValidationErrorPrinter,
	#superclass : #Object,
	#instVars : [
		'report',
		'writeStream'
	],
	#category : #'Clap-Core-Validation'
}

{ #category : #initialization }
ClapValidationErrorPrinter class >> on: aClapValidationReport [ 

	^ self new
		validationReport: aClapValidationReport;
		yourself
]

{ #category : #printing }
ClapValidationErrorPrinter >> printCommandHelp [

	(ClapDocumenter on: writeStream) 
		explain: report commandSpecification
]

{ #category : #printing }
ClapValidationErrorPrinter >> printDelimiterLine [

	writeStream
		<< '--------------------';
		cr
]

{ #category : #printing }
ClapValidationErrorPrinter >> printString [
	report isSuccess ifTrue: [ ^ '' ].

	^ String streamContents: [ :stream | 
		writeStream := stream.
		report problems
			do: [ :problem | 
					stream 
						nextPutAll: 'Error: ';
						nextPutAll: problem description; 
						cr ].
		self printDelimiterLine.
		self printCommandHelp ]
]

{ #category : #initialization }
ClapValidationErrorPrinter >> validationReport: aClapValidationReport [ 
	
	report := aClapValidationReport
]
