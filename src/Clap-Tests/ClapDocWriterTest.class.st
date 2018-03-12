Class {
	#name : #ClapDocWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'subject',
		'command'
	],
	#category : #'Clap-Tests-Integration'
}

{ #category : #running }
ClapDocWriterTest >> setUp [
	subject := ClapDocWriter new: '' writeStream.
	command := (ClapCommand withName: 'foo')
		addPositional: ((ClapPositional withName: 'class') description: 'Name of a class');
		addFlag: ((ClapFlag withName: 'force') description: 'force removing')
]

{ #category : #tests }
ClapDocWriterTest >> testPrintElementsOf [
	subject printCategory: 'OPTIONS:' of: command flags.
	subject stream contents lines should equal: {
		''.
		'OPTIONS:'.
		'--force,-f ', String tab, 'force removing'
	}
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsage [
	subject printUsage: '' of: command.
	subject stream contents lines first should equal: 'foo --force,-f <class> '
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsageOfSubcommandWithMultipleSubcommands [
	command addSubcommand: ((ClapCommand withName: 'git')
		addSubcommand: (ClapCommand withName: 'add');
		addSubcommand: (ClapCommand withName: 'branch')).
		
	subject printUsage: '' of: command.
	
	subject stream contents lines should equal: #(
		'foo --force,-f <class> git add '
		'foo --force,-f <class> git branch '
	)
]
