Class {
	#name : #ClapParameterizedMatchTest,
	#superclass : #ClapMatchTest,
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapParameterizedMatchTest >> classToTest [
	^ ClapParameterizedMatch
]

{ #category : #tests }
ClapParameterizedMatchTest >> testAt [
	[ :spec1 :arg1 :spec2 :arg2 |
		arg1 stub specification willReturn: spec1.
		arg2 stub specification willReturn: spec2.
		subject recordParameterMatch: arg1.
		subject recordParameterMatch: arg2.
		(subject at: spec1) should be: arg1.
		(subject at: spec2) should be: arg2.
	] runWithMocks
	
]
