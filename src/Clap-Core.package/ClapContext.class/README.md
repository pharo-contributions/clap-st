I represent the (stateful) context in which command parsing happens.
Most importantly I own a stream over the sequence of arguments to parse.

For example, the command "eval '1 + 2' " is represented by this:
	ClapContext on: #('eval' '1 + 2')