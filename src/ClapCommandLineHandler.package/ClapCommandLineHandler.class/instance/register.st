tools registry
register
"I will unregister the current BasicCommandLineHandler and register ClapCommandLineHandler to sessionManager."
SessionManager default 
	unregisterClassNamed:	#BasicCommandLineHandler .
SessionManager default 
		registerSystemClassNamed: self name