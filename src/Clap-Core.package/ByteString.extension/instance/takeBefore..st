*Clap-Core
takeBefore: aCharacter
	| res |
	res := ''.
	self do: [ :c | c = aCharacter ifTrue: [ ^ res ].res := res , (c asString) ]
	