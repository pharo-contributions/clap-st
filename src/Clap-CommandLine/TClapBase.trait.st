"
I provide instanciation boilerplate for classes implementing Clap commands.

A common pattern for non-trivial Clap commands is to delegate actual behavior to the instance side,  with a meaning block ending with something like ==(MyImplementorClass with: args) executeThis==. On the instance side of MyImplementorClass,  the whole match tree is available,  but argument queries can also be factored out into simple accessors.

"
Trait {
	#name : #TClapBase,
	#instVars : [
		'arguments'
	],
	#category : #'Clap-CommandLine'
}

{ #category : #'instance creation' }
TClapBase classSide >> with: arguments [
	^ self new
		setArguments: arguments;
		yourself
]

{ #category : #accessing }
TClapBase >> context [
	^ arguments context
]

{ #category : #initialization }
TClapBase >> setArguments: args [
	arguments := args
]
