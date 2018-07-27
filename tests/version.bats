#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "version, default format" {
    run clap version
    assert_success
    assert_output --regexp '^Pharo-[0-9]\.[0-9].*\.build\.[0-9]+\.sha\.[[:xdigit:]]+.*$'
}

@test "version, full" {
    run clap version --full
    assert_success
    assert_output --regexp '^Pharo-[0-9]\.[0-9].*\.build\.[0-9]+\.sha\.[[:xdigit:]]+.*$'
}

@test "version, release" {
    run clap version --release
    assert_success
    assert_output --regexp '^Pharo[0-9]\.[0-9](alpha|stable)$'
}

@test "version, numeric" {
    run clap version --numeric
    assert_success
    assert_output --regexp '^[0-9][0-9][0-9][0-9][0-9]$'
}

@test "version, hash" {
    run clap version --hash
    assert_success
    assert_output --regexp '^[[:xdigit:]]+$'
}

@test "version, vm" {
    run clap version --vm
    assert_success
    assert_output --partial 'uuid: '
    assert_output --partial 'VM: '
    assert_output --partial 'CommitHash: '
    assert_output --partial 'Plugins: '
}

@test "version, license" {
    run clap version --license
    assert_success
    assert_line --index 0 'LICENSE'
    assert_line --index 2 'Licensed under the MIT License with parts under the Apache License.'
}

@test "version, multiple formats" {
    run clap version --hash --release --numeric
    assert_success
    assert_line --index 0 --regexp '^[[:xdigit:]]+$'
    assert_line --index 1 --regexp '^Pharo[0-9]\.[0-9]'
    assert_line --index 2 --regexp '^[0-9][0-9][0-9][0-9][0-9]$'
}

@test "version help" {
    skip 'unknown flags should fail'
    run clap version --help
    assert_failure
}
