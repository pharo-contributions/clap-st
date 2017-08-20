as yet unclassified
tryMatch: aContext
"This method runs a match on the context and returns the match"
	| clapMatch |
	clapMatch := self run: aContext.
	"clapMatch class == ClapCommandMatch 
	ifTrue:"
	 match := clapMatch . 
	^self .