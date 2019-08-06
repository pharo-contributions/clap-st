#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "test, single package" {
    run silently clap test 'Clap-Tests'

    assert_line 'Clap-Tests'
    assert_line --regexp '[0-9]+ ran, [0-9]+ passed, [0-9]+ skipped, [0-9]+ expected failures, [0-9]+ failures, [0-9]+ errors, [0-9]+ passed unexpected'
}

@test "test, matching packages" {
    run silently clap test 'Clap.*-Tests'

    assert_line 'Clap-Tests'
    assert_line 'Clap-Okay-Tests'
    assert_line --regexp '[0-9]+ ran, [0-9]+ passed, [0-9]+ skipped, [0-9]+ expected failures, [0-9]+ failures, [0-9]+ errors, [0-9]+ passed unexpected'
}
