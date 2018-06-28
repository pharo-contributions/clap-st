"
I represent the concrete manifestation of a formal parameter during a command activation.
"
Class {
	#name : #ClapExpression,
	#superclass : #Object,
	#category : #'Clap-Core-Activation'
}

{ #category : #evaluating }
ClapExpression >> evaluateMeaning: arg [
	^ self subclassResponsibility
]
