printing
handleOutput: aMatch
	"Uses the contents of match saves the image"

	| imageName oldImageFile oldChangesFile |
	imageName := (aMatch atName: 'imageName')
		value.
	oldImageFile := File
		named: Smalltalk imagePath.
	oldChangesFile := File
		named:
			(Smalltalk imagePath copyUpToLast: '.')
				, '.changes'.
	(Smalltalk saveAs: imageName)
		ifTrue:
			[ "rebooting, when executing this, we are already in the renamed image" ^ self ].

	"...otherwise continuing"
	(aMatch includesKey: 'delete-old')
		ifFalse: [ ^ self quit ].
	oldImageFile delete.
	oldChangesFile delete