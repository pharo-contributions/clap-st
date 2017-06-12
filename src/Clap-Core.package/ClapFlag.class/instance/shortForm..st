setting
shortForm: aWord
	aWord size > 1 ifTrue: [ LongInsteadOfShortException signal ].
	shortForm := '-' , aWord