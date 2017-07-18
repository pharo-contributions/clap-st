instance creation
create
	| doc verbose class |
	doc := ClapCommand withName: 'doc'.
	verbose := ClapFlag withName: 'verbose'.
	verbose description: 'More informations'.
	class := ClapPositional withName: 'class'.
	class description: 'The name of the class to doc'.
	doc
		addPositional: class;
		addFlag: verbose.
	^ doc