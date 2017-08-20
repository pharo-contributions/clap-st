tests
testMatchCommandName
	| handlerClass arguments |
	handlerClass := self classToTest.
	arguments := OrderedCollection with: ((handlerClass handlers at:1) command canonicalName). 
	self assert:((handlerClass matchCommandName: arguments) size >= 1) equals: true. 