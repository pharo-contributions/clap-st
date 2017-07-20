initialization
parse
	arguments do: [ :word | |wordMatch|
		wordMatch := match recognize: word.
		wordMatch recordIn: match ].
	
	^ match recognizeEnd