matching
matchesOn: aStream do: aBlock
	| match |
	[
		match := self matchOn: aStream.
		match isMismatch
	] whileFalse: [ aBlock cull: match ]