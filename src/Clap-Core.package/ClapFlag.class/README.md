I represent a flag.

Flags can appear in any order in the input and are recognized by their form, starting with dashes (e.g. `--foo` in long form or `-f` in short form).

If you want to add an identifier for your flag:
	flag addIdentifier: <aName>
	
If you want to remove an identifier:
	flag removeIdentifier: <aName>
And it raises an exception if the flag doesn't contain the identifier