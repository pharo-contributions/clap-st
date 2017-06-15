adding
add: aWord
	(aWord matchesRegex: '(--|\+\+).*')
		ifFalse: [ ShortInsteadOfLongException signal ].
		aliases add: aWord