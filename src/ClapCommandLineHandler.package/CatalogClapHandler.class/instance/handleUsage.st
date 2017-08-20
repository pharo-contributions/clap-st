printing
handleUsage
	"This method prints out the usage incase of wrong number of arguments."

	self
		print: 			'Usage: get [--help] ProjectName [--version] [<version>] or'.
	self
		print: 'get [-h] ProjectName [-v] [<version>]'