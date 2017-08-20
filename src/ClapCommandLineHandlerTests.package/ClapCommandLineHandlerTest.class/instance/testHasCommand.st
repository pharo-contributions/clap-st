tests
testHasCommand
	^ (self classToTest) handlers allSatisfy: [ :class | class hasCommand]