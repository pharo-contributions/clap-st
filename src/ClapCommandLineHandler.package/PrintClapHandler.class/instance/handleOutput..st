printing
handleOutput: aFlag 
	"This method is used to handle the output with the match as input."
	aFlag canonicalName = 'numeric'
	ifTrue:[^ self printNumericVersion ].
	aFlag canonicalName = 'release' 
	ifTrue:[^ self printRelease ].