doc
printCategory: aString of: args
	"A generic method to print a list of args according to the type"
	args size = 0
		ifFalse: [ self addToStream: String cr , aString , String cr.
			args
				do: [ :a | self addToStream: (a accept: self) , String tab , a description , String cr ] ]