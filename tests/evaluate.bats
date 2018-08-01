#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "evaluate, argument" {
    run silently clap evaluate '1 class'

    assert_success
    assert_output 'SmallInteger'
}

@test "evaluate, piped" {
    skip 'output disappears as soon as we pipe input…'
    output="$( echo '2+3' | clap evaluate )"# bats's run helper doesn't support piping

    assert_success
    assert_output 'Metaclass'
}
