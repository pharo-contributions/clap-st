as yet unclassified
getProject: aMatch
	"Install the project from the match"

	| project projectName version |
	projectName := (aMatch atName: 'projectName') value.
	version := (aMatch includesKey: 'versionNumber')
		ifTrue: [ (aMatch atName: 'version') value ]
		ifFalse: [ #stable ].
	project := CatalogProvider projectNamed: projectName.
	self inform: 'Installing ' , project name.
	project isAvailableForCurrentPharo
		ifFalse: [ self
				warning:
					('{1} is not tagged as available for current Pharo version. Trying to install anyway, but it can fail!'
						format: {projectName}) ].
	project installVersion: version.
	Smalltalk snapshot: true andQuit: true