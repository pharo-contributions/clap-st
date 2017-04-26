I am a class which represents all the possible ways to execute a command.

For example,  imagine you have two ways to execute the command eval with the help flag, the first one is "eval -h <exp>" and the second one is "eval --help <exp>".You create a ClapCommand for the first: 
	c1 := (ClapCommand withName: 'eval')
		addFlag: ClapFlag withName: 'h';
		...
		
And the second:  
	c2 := (ClapCommand withName: 'eval')
		addFlag: ClapFlag withName: 'help';
		...

And you create your ClapAlternative like this:
	(ClapAlternative new) add: c1;add: c2.	

		
This class stocks these commands in an OrderedCollection called alternatives, so the first ClapCommand you add to the ClapAlternative will be evaluated first and so forth.

The principle of a ClapAlternative matching is to evaluate in the order all which is in the collection alternatives.As soon as a matching returns true, it stops and it's the matching with the specific command which is returned