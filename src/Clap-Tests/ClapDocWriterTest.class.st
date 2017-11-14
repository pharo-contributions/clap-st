Class {
	#name : #ClapDocWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'subject',
		'argv',
		'newLine'
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
		addFlag: flag.
	newLine := subject newLineString
]

{ #category : #tests }
ClapDocWriterTest >> testPrintElementsOf [
	| expected |
	expected := newLine , 'OPTIONS:' , newLine.
	expected := expected , '--force,-f ' , String tab , 'force removing' , newLine.
	subject printCategory: 'OPTIONS:' of: argv flags.
	subject stream contents should equal: expected
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsage [
	| expected |
	expected := 'foo --force,-f <class> ' , newLine.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected
]

{ #category : #tests }
ClapDocWriterTest >> testPrintUsageOfSubcommandWithMultipleSubcommands [
	| expected subcommand |
	expected := 'foo --force,-f <class> git add ' , newLine.
	expected := expected , 'foo --force,-f <class> git brench ' , newLine.
	subcommand := (ClapCommand withName: 'git')
		addSubcommand: (ClapCommand withName: 'add');
		addSubcommand: (ClapCommand withName: 'brench').
	argv addSubcommand: subcommand.
	subject printUsage: '' of: argv.
	subject stream contents should equal: expected
]
