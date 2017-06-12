I represent a flag.

Flags can appear in any order in the input and are recognized by their form, starting with dashes (e.g. `--foo` in long form or `-f` in short form).

You must put explicitly the long and short form of your flag:
	aFlag shortForm: <aName>
	aFlag longForm: <aName>
	
If you try to put the bas form, an exception is raised.

You can also put aliases to your flag:
	aFlag addAlias: <aName>
	
And to remove it:
	aFlag removeAlias: <aName>
	
If the alias doesn't exist, an exception is raised