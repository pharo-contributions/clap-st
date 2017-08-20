as yet unclassified
startHandler: arguments
"This method activates the handler with given arguments and handles errors"
	| matchedCollection |
	arguments
	ifNotEmpty: [ 
	( matchedCollection := self matchCommandName: arguments )
	ifEmpty: [ ^ Error  ] ifNotEmpty:[ matchedCollection size =1 ifTrue:[^ self runHandler: arguments on: matchedCollection first ]. ^self duplicateNames]]
	ifEmpty: [''].