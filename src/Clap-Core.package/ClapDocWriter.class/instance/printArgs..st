doc
printArgs: aCommand
	"Prints the list of positionals"
	self printCategory: 'ARGS:' of: aCommand positionals