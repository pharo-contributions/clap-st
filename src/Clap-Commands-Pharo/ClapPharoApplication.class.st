Class {
	#name : #ClapPharoApplication,
	#superclass : #ClapApplication,
	#category : #'Clap-Commands-Pharo'
}

{ #category : #execution }
ClapPharoApplication >> execute [

	self prepareImage
]

{ #category : #execution }
ClapPharoApplication >> prepareImage [
	self positional: #rename ifPresent: [ :rename | 
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
	^ (self hasFlag: #save)
		or: [ (self hasFlag: #noSave) not ]
]
