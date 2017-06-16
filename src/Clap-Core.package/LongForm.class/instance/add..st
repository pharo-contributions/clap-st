adding
add: words
	words
		do: [ :w | 
			(w matchesRegex: '(--|\+\+)[[:alpha:]]*')
				ifFalse: [ ShortInsteadOfLongException signal ].
			self add: w ]