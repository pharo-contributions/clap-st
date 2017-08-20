printing
print: aString
	"Prints the string onto the command line"
	self stdout
		nextPutAll: aString;
		lf