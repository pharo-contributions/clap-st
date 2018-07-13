Class {
	#name : #ClapImplicit,
	#superclass : #ClapExpression,
	#instVars : [
		'specification',
		'parent'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'instance creation' }
ClapImplicit class >> of: aParameter in: parentMatch [
	^ (self specification: aParameter)
		parent: parentMatch;
		yourself
]

{ #category : #'instance creation' }
ClapImplicit class >> specification: aParameter [ 
	^ self new
		specification: aParameter;
		yourself
]

{ #category : #evaluating }
ClapImplicit >> evaluateMeaning: arg [
	^ specification defaultMeaning cull: self cull: arg
]

{ #category : #testing }
ClapImplicit >> isExplicit [
	^ false
]

{ #category : #accessing }
ClapImplicit >> parent [
	^ parent
]

{ #category : #accessing }
ClapImplicit >> parent: aMatch [
	parent := aMatch
]

{ #category : #accessing }
ClapImplicit >> rootMatch [
	^ parent
		ifNil: [ self ]
		ifNotNil: [ parent rootMatch ]
]

{ #category : #accessing }
ClapImplicit >> specification [
	^ specification
]

{ #category : #initialization }
ClapImplicit >> specification: anArgumentSpec [ 
	specification := anArgumentSpec
]

{ #category : #evaluating }
ClapImplicit >> value [
	^ self value: nil
]

{ #category : #evaluating }
ClapImplicit >> value: arg [
	^ self evaluateMeaning: arg
]

{ #category : #accessing }
ClapImplicit >> word [
	^ nil
]
