as yet unclassified
runHandler: arguments on: aHandler
"This method converts the arguments into context and activates the sub class handler."
	| context aHandlerInstance |
	context := ClapContext on:arguments.
	aHandlerInstance := aHandler new.
	"arguments size = 1
	ifFalse:["
	[aHandlerInstance tryMatch: context.
	aHandlerInstance  activate: aHandlerInstance match]
	on: Exit
	do: [ :exit | ^ self handleExit: exit ].
"	^ aHandlerInstance match."
	"].
		^ aHandlerInstance handleUsage."
	