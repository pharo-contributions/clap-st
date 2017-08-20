activation
activate
"This method invokes the handler by gathering the arguments and sending a message and also exits the handler."
	[self startHandler: (self arguments)]
		on: Exit 
		do: [ :exit | ^ self handleExit: exit ]