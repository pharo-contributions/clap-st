I represent a flag.

Flags can appear in any order in the input and are recognized by their form, starting with dashes (e.g. `--foo` in long form or `-f` in short form).

By default, the flag can accept short and long forms but if you want the flag accepts an only form, you can do this:
	<aFlag> longOnly.
	<aFlag> shortOnly.
	
And after, if you want your flag accepts again the both forms:
	<aFlag> longAndShort.