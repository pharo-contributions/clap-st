Class {
	#name : #ClapImage,
	#superclass : #ClapApplication,
	#category : #'Clap-Commands-Pharo'
}

{ #category : #'command line - subcommands' }
ClapImage class >> cleanupCommand [
	^ (ClapCommand withName: 'cleanup')
		description: 'Clean caches & other temporary data from the image ';
		add:
			((ClapFlag withName: 'aggressive')
				description: 'Also delete resources, change sets, etc');
		add:
			((ClapFlag withName: 'release')
				description: 'Prepare for release (implies --aggressive)');
		add:
			((ClapFlag withName: 'production')
				description: 'Unload tests, examples, etc, for production (implies --release)')
]

{ #category : #'command line' }
ClapImage class >> image [
	<commandline>
	^ (ClapCommand withName: 'image')
		description: 'Manage image/changes files';
		add: self saveCommand;
		add: self cleanupCommand;
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help | 
				help value; exitSuccess ].
			args validateAll.
			(self with: args) execute ]
]

{ #category : #'command line - subcommands' }
ClapImage class >> saveCommand [
	^ (ClapCommand withName: 'save')
		description: 'Save the image/changes file under a new name';
		add: (ClapFlag withName: 'rename');
		add: (ClapFlag withName: 'backup');
		add: (ClapPositional withName: 'NEW')
]
