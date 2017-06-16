adding
add: words
	words
		do: [ :w | 
			(w matchesRegex: '(-|\+)[[:alpha:]]*')
				ifFalse: [ LongInsteadOfShortException signal ].
			self add: w ]