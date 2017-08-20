as yet unclassified
collectHandlers
	"I look in the subclasses of ClapCommandLineHandler"
	| allCommands |
	allCommands := ClapCommandLineHandler allSubclasses select: [ :subclass | subclass hasCommand].
	allCommands ifEmpty: [^ nil].
	^ allCommands.