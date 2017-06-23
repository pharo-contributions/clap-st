matching
matchOn: aStream
	| arg word pos res |
	arg := aStream peek.
	(arg includes: $=)
		ifFalse: [ ^ super matchOn: aStream ].
	word := arg takeBefore: $=.
	res := OrderedCollection new.
	res add: word.
	pos := $, split: (arg takeAfter: $=).
	res addAll: pos.
	^ super matchOn: (ClapContext on: res)