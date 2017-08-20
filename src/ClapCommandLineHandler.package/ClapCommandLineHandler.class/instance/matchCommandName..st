as yet unclassified
matchCommandName: arguments
"This method matches the names of all the clapCommand handlers with the first arguments from given set of arguments."
	^ self handlers select:  [:each | (each command canonicalName = arguments first asString) ].