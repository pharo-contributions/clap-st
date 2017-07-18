doc
printCategory: aString of: args
	args size = 0
		ifFalse: [ self addToStream: String cr , aString , String cr.
			args do: [ :a | self addToStream: (a accept: self) , String tab , a description , String cr ] ]