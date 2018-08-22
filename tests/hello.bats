#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "hello, no argument" {
    run silently clap hello
    assert_success
    assert_output 'hello, world.'
}

@test "hello, single word" {
    run silently clap hello Pharo
    assert_success
    assert_output 'hello, Pharo.'
}

@test "hello, quoted words" {
    run silently clap hello 'Pharo and friends'
    assert_success
    assert_output 'hello, Pharo and friends.'
}

@test "hello, separate words" {
    run silently clap hello Pharo friends 'everyone else'
    assert_success
    assert_line --index 0 'hello, Pharo.'
    assert_line --index 1 'hello, friends.'
    assert_line --index 2 'hello, everyone else.'
}

@test "hello, bad format" {
    run clap hello foo.
    assert_failure
    assert_output --partial 'foo.'
}

@test "hello shouting, no argument" {
    run silently clap hello -s
    assert_success
    assert_output 'HELLO, WORLD!'

    run silently clap hello --shout
    assert_success
    assert_output 'HELLO, WORLD!'
}

@test "hello shouting, with argument" {
    run silently clap hello -s 'pharo hackers'
    assert_success
    assert_output 'HELLO, PHARO HACKERS!'

    run silently clap hello --shout loudly
    assert_success
    assert_output 'HELLO, LOUDLY!'
}

@test "hello whispering" {
    run silently clap hello --whisper 'YOU know who'
    assert_success
    assert_output '(hello, you know who)'
}

@test "hello whispering and shouting" {
    skip 'not yet implemented'
    run clap hello --shout --whisper
    assert_failure
}

@test "hello help flag" {
    run silently clap hello --help
    assert_success
    assert_line --index 0 'Provides greetings'
    assert_line 'Usage: hello [--help] [--whisper] [--shout] [<who>]'
    assert_line 'Parameters:'
    assert_line --regexp '[[:space:]]+<who>[[:space:]]+Recipient of the greetings$'
    assert_line 'Options:'
    assert_line --regexp '[[:space:]]+--shout[[:space:]]+Greet loudly$'
}

@test "help hello" {
    run silently clap help hello
    assert_success
    assert_line --index 0 'Provides greetings'
}
