Class {
	#name : #ClapDocWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'subject',
		'argv'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapDocWriterTest >> setUp [
	| pos flag |
	subject := ClapDocWriter new: '' writeStream.
	pos := ClapPositional withName: 'class'.
	pos description: 'Name of a class'.
	flag := ClapFlag withName: 'force'.
	flag description: 'force removing'.
	argv := (ClapCommand withName: 'foo')
		addPositional: pos;
		addFlag: flag
]

{ #category : #tests }
ClapDocWriterTest >> testPrintElementsOf [
	| expected |
	expected := String cr , 'OPTIONS:' , String cr.
	expected := expected , '--force,-f ' , String tab , 'force removing' , String cr.
	subject printCategory: 'OPTIONS:' of: argv flags.
	subject stream contents should equal: expected
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsage [
	| expected |
	expected := 'foo --force,-f <class> ' , String cr.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsageOfSubcommandWithMultipleSubcommands [
	| expected subcommand |
	expected := 'foo --force,-f <class> git add ' , String cr.
	expected := expected , 'foo --force,-f <class> git brench ' , String cr.
	subcommand := (ClapCommand withName: 'git')
		addSubcommand: (ClapCommand withName: 'add');
		addSubcommand: (ClapCommand withName: 'brench').
	argv addSubcommand: subcommand.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected
]
