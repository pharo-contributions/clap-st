running
classToTest
	^ ClapCommandLineHandler new
	 handlerCollectionStrategy: (ClapHandlerCollectionStrategy new withAll:{EvalClapHandler. PrintClapHandler }); 
	yourself.