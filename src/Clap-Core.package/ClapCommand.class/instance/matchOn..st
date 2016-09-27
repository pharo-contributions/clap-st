matching
matchOn: aStream
	| match args |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWord: aStream next.
	args := ClapAlternative new
		add: self flags;
		add: self subcommands;
		add: self positionals.

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) recordIn: match ].

	^ match
