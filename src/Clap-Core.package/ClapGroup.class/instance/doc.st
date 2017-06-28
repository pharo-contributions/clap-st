doc
doc
	parameters
		do: [ :p | 
			Stdio stdout << p docName.
			Stdio stdout << '    '.
			Stdio stdout << p description;lf;crlf ]