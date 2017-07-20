accessing
recognize: aWord
	^ (self specification looksLikeFlag: aWord)
		ifTrue: [ self recognizeFlag: aWord ]
		ifFalse: [ self recognizePositional: aWord ]