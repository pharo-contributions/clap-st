setting
longForm: aWord
	aWord size = 1 ifTrue: [ ShortInsteadOfLongException signal ].
	longForm := '--' , aWord