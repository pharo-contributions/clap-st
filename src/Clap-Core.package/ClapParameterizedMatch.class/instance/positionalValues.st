evaluating
positionalValues
	| values |
	values := OrderedCollection new.
	arguments do: [ :arg | arg class = ClapPositionalMatch ifTrue: [ values add: arg word ] ].
	^ values