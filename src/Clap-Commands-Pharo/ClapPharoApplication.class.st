Class {
	#name : #ClapPharoApplication,
	#superclass : #ClapApplication,
	#category : #'Clap-Commands-Pharo'
}

{ #category : #execution }
ClapPharoApplication >> execute [
	arguments validateAll.
	arguments	atName: 'help' ifFound: [ :help | help value; exitSuccess ].

	self prepareImage
]

{ #category : #execution }
ClapPharoApplication >> prepareImage [
	arguments atName: 'rename' ifFound: [ :rename | 
		| imageFile |
		imageFile := rename value asFileReference.
		self flag: 'check if it already exists & not same as current'.
		Smalltalk image
				changeImagePathTo: imageFile;
				closeSourceFiles;
				openSourceFiles ]
]

{ #category : #execution }
ClapPharoApplication >> shouldSave [
	^ (arguments atName: 'save') isExplicit
		or: [ (arguments atName: 'no-save') isExplicit not ]
]
