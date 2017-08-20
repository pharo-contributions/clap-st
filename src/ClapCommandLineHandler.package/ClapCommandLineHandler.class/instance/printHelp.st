printing
printHelp
"Prints out the class comment when arguments are not completely given"
	self stderr
		nextPutAll: self class comment;
		lf