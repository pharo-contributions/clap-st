as yet unclassified
testMatchesAreNotMismatches
	subject isMismatch should be: false.
	subject ifMismatch: [ self fail ]