matching
matchDeferred
	| top match |
	deferred ifEmpty: [ ^ self mismatch ].
	
	top := deferred pop.
	match := top key matchOn: arguments.
	match ifMismatch: [
		deferred push: top.
		self mismatch ].
	
	match addTo: top value.
	^ match