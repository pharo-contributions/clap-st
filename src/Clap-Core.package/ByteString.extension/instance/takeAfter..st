*Clap-Core
takeAfter: aCharacter
	| size res |
	size := self size.
	res := ''.
	(1 to: size)
		reverseDo: [ :n | 
			| c |
			c := self at: n.
			c = aCharacter
				ifTrue: [ ^ res ].
			res := c asString , res ]