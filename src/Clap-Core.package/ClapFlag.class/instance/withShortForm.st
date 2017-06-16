setting
withShortForm
	| o |
	o := OrderedCollection new.
	o add: self shortName.
	shortForm add: o