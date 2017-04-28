I represent a class which represents all the several ways to recognize a single parameter.

For example,  imagine you have two ways to execute the command eval with the help flag, the first one is "eval -h <exp>" and the second one is "eval --help <exp>". Here, you have two ways to recognize the flag; so you can do:

To create the first way:
	f1 := ClapFlag withName: 'h'
	
To create the second one:
	f2 := ClapFlag withName: 'help'
	
To create the ClapAlternative:
	alternative := ClapAlternative new add: f1; add: f2
	
And when you create your command:
	(ClapCommand withName: 'eval')
		addFlag: alternative;
		addPositional: (ClapPositional withName: 'exp')

	
		
This class stores these ways in an OrderedCollection called alternatives, so the first instance you add to the ClapAlternative will be evaluated first and so forth when the matchOn: method is invoked.

The principle of a ClapAlternative matching is to evaluate in the order all which is in the collection alternatives. As soon as a matching returns true, it stops and it's the matching with the specific command which is returned.