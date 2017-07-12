initialization
parse
	arguments do: [ :word |
		currentMatch := currentMatch recognize: word ].
	
	^ currentMatch recognizeEnd