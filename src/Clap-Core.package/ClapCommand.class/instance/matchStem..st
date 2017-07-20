matching
matchStem: word
	^ word = self canonicalName
		ifTrue: [ self matchWord: word ]
		ifFalse: [ self mismatch ]