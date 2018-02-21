Class {
	#name : #ClapFlagTest,
	#superclass : #ClapParameterTest,
	#category : 'Clap-Tests-Unit'
}

{ #category : #accessing }
ClapFlagTest >> classToTest [
	^ ClapFlag
]

{ #category : #tests }
ClapFlagTest >> testDefaultMeaningNoArguments [
	| match meaning |
	match := Mock new.
	match stub isExplicit willReturn: true.
	
	meaning := subject meaningOf: match.
	
	meaning should equal: true
]

{ #category : #tests }
ClapFlagTest >> testMatchesLongForm [
	| match |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match word should equal: '--foo'
]

{ #category : #tests }
ClapFlagTest >> testMatchesShortForm [
	| match |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should receive next once.
	match should not be isMismatch.
	match specification should be: subject.
	match word should equal: '-f'
]

{ #category : #tests }
ClapFlagTest >> testPremiseLongForm [
	| premiseMatch fullMatch |
	argv stub peek willReturn: '--foo'.
	argv stub next willReturn: '--foo'.
	argv stub atEnd willReturn: true.
	
	premiseMatch := subject matchPremiseOn: argv.
	
	argv should receive next once.
	premiseMatch should not be isMismatch.
	premiseMatch specification should be: subject.
	premiseMatch word should equal: '--foo'.
	
	fullMatch := subject with: premiseMatch matchOn: argv.
	
	fullMatch should be: premiseMatch.
	fullMatch should not be isMismatch.
	fullMatch word should equal: '--foo'
]

{ #category : #tests }
ClapFlagTest >> testPremiseShorForm [
	| premiseMatch fullMatch |
	argv stub peek willReturn: '-f'.
	argv stub next willReturn: '-f'.
	argv stub atEnd willReturn: true.
	
	premiseMatch := subject matchPremiseOn: argv.
	
	argv should receive next once.
	premiseMatch should not be isMismatch.
	premiseMatch specification should be: subject.
	premiseMatch word should equal: '-f'.
	
	fullMatch := subject with: premiseMatch matchOn: argv.
	
	fullMatch should be: premiseMatch.
	fullMatch should not be isMismatch.
	fullMatch word should equal: '-f'
]

{ #category : #tests }
ClapFlagTest >> testWrongPremiseLongForm [
	| premiseMatch |
	argv stub peek willReturn: '--fooNOT'.
	argv stub next willReturn: '--fooNOT'.
	
	premiseMatch := subject matchPremiseOn: argv.
	
	argv should not receive next.
	premiseMatch should be isMismatch.
	premiseMatch specification should be: subject
]

{ #category : #tests }
ClapFlagTest >> testWrongPremiseShortForm [
	| premiseMatch |
	argv stub peek willReturn: '-F'.
	argv stub next willReturn: '-F'.
	
	premiseMatch := subject matchPremiseOn: argv.
	
	argv should not receive next.
	premiseMatch should be isMismatch.
	premiseMatch specification should be: subject
]
