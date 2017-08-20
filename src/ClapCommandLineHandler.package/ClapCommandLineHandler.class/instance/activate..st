event handling
activate: aMatch
"This method handles the output using the match argument."
	[  self handleActivate: aMatch ]
	on: Exit
	do: [ :exit  | ^ self handleExit: exit]