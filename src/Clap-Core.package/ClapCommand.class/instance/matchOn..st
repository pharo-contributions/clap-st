matching
matchOn: aStream
	| match args subMatch |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWord: aStream next.
	args := ClapAlternative new
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals).

	[ aStream atEnd ] whileFalse: [ subMatch := args matchOn: aStream. subMatch isMismatch ifTrue: [ ^ self mismatch ]. subMatch recordIn: match ].

	^ match
