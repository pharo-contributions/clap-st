setting
put: aPos
	(self check: aPos) ifFalse: [ ^ 0 ].
	positional := aPos