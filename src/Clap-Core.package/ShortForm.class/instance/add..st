adding
add: aWord
	(aWord matchesRegex: '(-|\+)[:alpha:]')
		ifFalse: [ LongInsteadOfShortException signal ].
		aliases add: aWord