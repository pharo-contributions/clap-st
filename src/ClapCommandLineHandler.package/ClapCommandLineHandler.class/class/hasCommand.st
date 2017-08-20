testing
hasCommand
"This method checks if the subClasses have a method 'command'."
	self class methodDictionary at: #command ifPresent: [ ^ true ] .
^ false.