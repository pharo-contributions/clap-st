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

	[ subMatch := args matchOn: aStream. subMatch isMismatch ]
		whileFalse: [ subMatch recordIn: match ].

	^ match
