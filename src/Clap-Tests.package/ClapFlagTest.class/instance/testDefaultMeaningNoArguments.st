tests
testDefaultMeaningNoArguments
	| match meaning |
	match := Mock new.
	match stub isMismatch willReturn: false.
	
	meaning := subject meaningOf: match.
	
	meaning should equal: true