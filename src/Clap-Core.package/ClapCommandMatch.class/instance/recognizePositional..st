accessing
recognizePositional: aWord
	^ self specification positionals
		detect: [ :pos | (self hasValueFor: pos) not ]
		ifNone: [ self notYetImplemented ]