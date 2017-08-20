printing
handleUsage
	"This method prints out the usage incase of wrong number of arguments."

	self
		print:
			'Usage: eval [--help]  [--save] [ --no-quit ] <smalltalk expression> or'.
	self
		print: 'eval [-h] [-s] [-n] <smalltalk expression>'