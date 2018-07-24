#!/usr/bin/env bats
# -*- mode: bats; -*-

# Get VM & image from CI environment
: ${CLAP:=$SMALLTALK_CI_VM $SMALLTALK_CI_IMAGE}

# As special case for fari-based development environment, force the headless VM
[[ "$CLAP" == 'fari run '* ]] && export PHARO=${PHARO%-ui}

function clap() { $CLAP clap "$@"; }

function silently() { "$@" 2>/dev/null; }

load bats-support/load
load bats-assert/load

@test "implicit argument" {
    run silently clap hello
    assert_output 'hello, world.'
}

@test "explicit argument, single word" {
    run silently clap hello Pharo
    assert_output 'hello, Pharo.'
}

@test "explicit argument, quoted" {
    run silently clap hello 'Pharo and friends'
    assert_output 'hello, Pharo and friends.'
}

@test "several arguments" {
    skip 'only the first positional is used for now'
    run silently clap hello Pharo friends 'and more'
    assert_output 'hello, Pharo friends and more.'
}

@test "implicit shouting" {
    run silently clap hello -s
    assert_output 'HELLO, WORLD!'

    run silently clap hello --shout
    assert_output 'HELLO, WORLD!'
}

@test "explicit shouting" {
    run silently clap hello -s 'pharo hackers'
    assert_output 'HELLO, PHARO HACKERS!'

    run silently clap hello --shout loudly
    assert_output 'HELLO, LOUDLY!'
}

@test "help" {
    run silently clap hello --help
    assert_line --index 0 'Provides greetings'
    assert_line 'Usage: hello [--help] [--shout] [<who>]'
    assert_line 'Parameters:'
    assert_line 'Options:'
}
