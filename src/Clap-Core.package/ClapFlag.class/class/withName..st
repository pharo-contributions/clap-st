instance creation
withName: aString
	| flag |
	flag := super withName: aString.
	flag addIdentifier: flag shortForm.
	flag addIdentifier: flag longForm.
	^ flag  