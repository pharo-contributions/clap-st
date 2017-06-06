matching
match: aWord
	^ (aWord = (self longForm)) or: aWord = (self shortForm) 