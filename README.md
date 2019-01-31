# clap — Command line argument parser for Pharo
[![Build Status][travis-status]][travis]
[![Coverage Status][coveralls-status]][coveralls]

Named after and inspired by [clap-rs](https://github.com/kbknapp/clap-rs), but
this is an independent implementation.

<p align="center">
  <img src="/demos/clap.gif?raw=true" width="640" height="360" alt="Terminal screencast demo"/>
</p>

Currently still in the initial implementation phase, meaning the main pieces are
there but many features are still missing and may force changes in the design.

### Loading instructions

#### starting from a Pharo image

```smalltalk
Metacello new baseline: 'Clap';
    repository: 'github://cdlm/clap-st/src';
    load.
```

#### starting from the shell

```shell
git clone https://github.com/cdlm/clap-st.git
cd clap-st
curl get.pharo.org/alpha | bash
```

…and then, in the image just downloaded, open a workspace and evaluate:

```smalltalk
Metacello new baseline: 'Clap';
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

#### running the tests

In-image tests run the usual way. Additionally, a few more tests exercise the
included commands through the whole system, including VM startup and shutdown;
running those requires [Bats](https://github.com/bats-core/bats-core):

```shell
# $CLAP should contain whatever command launches your VM and image:
# export CLAP="$PHARO_VM $PHARO_IMAGE"
# or, with fari: export CLAP="fari run --"
bats tests
```

You can also check the `.travis.yml` file for reference.

### Defining and invoking commands

Commands and subcommands are instances of `ClapCommand`. To make a command
accessible from the command line, return it from a class-side factory method
with the `<commandline>` pragma. For instance, here's how we declare the
traditional *hello, world!* example, with the actual behavior delegated the
instance-side method `ClapCommandLineExamples >> sayHello`:

```smalltalk
hello
	"The usual Hello-World example, demonstrating a Clap command with a couple options."
	<commandline>

	^ (ClapCommand withName: 'hello')
		description: 'Provides greetings';
		add: ClapFlag forHelp;
		add: ((ClapFlag withName: 'shout')
			description: 'Greet loudly');
		add: ((ClapPositional withName: 'who')
			description: 'Recipient of the greetings';
			defaultMeaning: [ 'world' ]);
		meaning: [ :args |
			args atName: 'help' ifFound: [ :help |
				help value.
				help context exitSuccess ].

			(self with: args) sayHello ]
```

For now, Clap installs itself as a named command line handler; e.g., to run the
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
	runWith: #('hello' '--help').
```

[travis]: https://travis-ci.org/cdlm/clap-st
[travis-status]: https://travis-ci.org/cdlm/clap-st.svg?branch=master
[coveralls]: https://coveralls.io/github/cdlm/clap-st?branch=master
[coveralls-status]: https://coveralls.io/repos/github/cdlm/clap-st/badge.svg?branch=master

### Contributors

Many thanks to everyone who has contributed to clap in one way or another:

Clément Mastin, Damien Pollet, Rajula Vineet Reddy
