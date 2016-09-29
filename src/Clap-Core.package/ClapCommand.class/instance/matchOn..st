matching
matchOn: aStream
	| match args |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWord: aStream next.
	args := ClapAlternative new
		addAll: flags;
		addAll: subcommands;
		add: (ClapQueue withAll: positionals).

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) recordIn: match ].

	^ match
