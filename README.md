# CLAP — Command line argument parser for Pharo
[![Build Status][travis-status]][travis]
[![Coverage Status][coveralls-status]][coveralls]

Named after and inspired by [clap-rs](https://github.com/kbknapp/clap-rs), but
this is an independent implementation.

<p align="center">
  <img src="/demos/clap.gif?raw=true" width="640" height="360" alt="Terminal screencast demo"/>
</p>

CLAP project is after major refactoring (due to needs raised by [PharoLauncher CLI](https://github.com/pharo-project/pharo-launcher/tree/feature/cmd-line/src/PharoLauncher-CLI)) and should be more stable now. It means main pieces are
there but some features are still missing and eventually may force changes in the design in rare cases.

### Loading instructions

Pharo image already contains stable version of CLAP, but you can load latest version of project  by: 

```smalltalk
Metacello new 
	baseline: 'Clap';
    repository: 'github://pharo-contributions/clap-st/src';
    load.
```

#### starting from the shell

```shell
git clone https://github.com/pharo-contributions/clap-st.git
cd clap-st
curl https://get.pharo.org/64/ | bash
```

…and then, in the image just downloaded, open a workspace and evaluate:

```smalltalk
Metacello new 
	baseline: 'Clap';
   	repository: 'gitlocal://./src';
   	load.
```

Shameless plug: I work with [Fari](https://people.untyped.org/fari.sh) and
[direnv](https://direnv.net) to automate building and launching the development image:

```shell
# setup $PHARO
fari build
fari run
```

### Defining and invoking commands

Commands and subcommands (their specification) are instances of `#ClapCommandSpec`. To make a command
accessible from the command line, return it from a class-side factory method
with the `<commandline>` pragma. Such class-side method should be defined on user-defined subclass of `ClapApplication`. For instance, here's how we declare the
traditional *hello, world!* example, with the actual behavior delegated the
instance-side method `ClapCommandLineExamples >> sayHello`:

```smalltalk
hello
	"The usual Hello-World example, demonstrating a Clap command with a couple features."
	<script>
	<commandline>
	^ (ClapCommandSpec id: #hello)
		description: 'Provides greetings';
		commandClass: self;
		addHelp;
		addFlag: #whisper description: 'Greet discretely';
		addFlag: #shout description: 'Greet loudly';
		addFlag: #language 
			description: 'Select language of greeting' 
			positionalSpec: [ :positional |
				positional
					symbol;
					defaultValue: [ :arg :app | app defaultLanguage ] ];
		addPositional: #who spec: [ :positional |
			positional
				description: 'Recipient of the greetings';
				multiple: true;
				defaultValue: [ :arg :app | { app defaultRecipient } ] ];
		yourself
```

For now, CLAP installs itself as a named command line handler; e.g., to run the
`hello` example command:

```shell
$PHARO_VM $PHARO_IMAGE clap hello
$PHARO_VM $PHARO_IMAGE clap hello --shout you
```

Commands can also be tested from within the image; running them from an
interactive session will not quit the image, but any output from the command
will still go to the standard output:

```smalltalk
ClapCommandLineExamples hello
	activateWith: #('hello' '--help').
```

[travis]: https://travis-ci.org/cdlm/clap-st
[travis-status]: https://travis-ci.org/cdlm/clap-st.svg?branch=master
[coveralls]: https://coveralls.io/github/cdlm/clap-st?branch=master
[coveralls-status]: https://coveralls.io/repos/github/cdlm/clap-st/badge.svg?branch=master

### Contributors

Many thanks to everyone who has contributed to clap in one way or another:

Clément Mastin, Damien Pollet, Rajula Vineet Reddy, Christophe Demarey
