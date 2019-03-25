Class {
	#name : #ClapArgumentValidationTest,
	#superclass : #TestCase,
	#category : #'Clap-Tests-Validations'
}

{ #category : #tests }
ClapArgumentValidationTest >> testFailValidationWhenMissingMandatoryArgument [
	| flag match report |
	flag := (ClapFlag withName: 'lang')
		add: (ClapPositional withName: 'langCode');
		validations: [ :arg | {
			Okay if: [ :it | (it atName: 'langCode') isExplicit ]
		} collect: [ :each | each validate: arg ] ].
	
	match := flag match: #('--lang').
	report := ClapValidationReport success.
	match validateOn: report.
	
	self assert: report isFailure
]

{ #category : #tests }
ClapArgumentValidationTest >> testPassValidationWithMandatoryArgument [
	| flag match report |
	flag := (ClapFlag withName: 'lang')
		add: (ClapPositional withName: 'langCode');
		validations: [ :arg | {
			Okay if: [ :it | (it atName: 'langCode') isExplicit ]
		} collect: [ :each | each validate: arg ] ].
	
	match := flag match: #('--lang' 'eo').
	report := ClapValidationReport success.
	match validateOn: report.
	
	self assert: report isSuccess
]
