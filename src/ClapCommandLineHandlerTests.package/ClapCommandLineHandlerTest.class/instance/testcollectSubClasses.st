as yet unclassified
testcollectSubClasses
	| count |
	count := 0.
	ClapCommandLineHandler allSubclasses do: [ :each | (each class methods anySatisfy:  [ :method | method ~= #command ]) ifTrue: [count := count +1 ]].
	self assert: (self classToTest) handlers size <=  ClapCommandLineHandler allSubclasses size.
	self assert: ClapCommandLineHandler allSubclasses size equals: count.
	