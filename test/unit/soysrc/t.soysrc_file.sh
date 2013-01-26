#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  echo 'echo ${BASH_SOURCE[@]}'   >   ${valid_file}
  echo '___INVALID_STRINGOOOO___' > ${invalid_file}

  function soysrc_hook() {
    echo "[hook] '$@'"
    echo "[hook] soysrc_path : '${soysrc_path}'"
  }
}

function tearDown() {
  rm -f   ${valid_file}
  rm -f ${invalid_file}
}

##

function test_file_not_found() {
  soysrc not-found.sh 2>/dev/null
  assertNotEquals $? 0
}

## path

function test_file_found_full_path() {
  soysrc ${valid_file} >/dev/null
  assertEquals $? 0
}

function test_file_found_relative_path() {
  soysrc ./$(basename ${valid_file}) >/dev/null
  assertEquals $? 0
}

function test_file_found_pwd() {
  soysrc $(basename ${valid_file}) >/dev/null
  assertEquals $? 0
}

## eval

function test_file_found_invalid() {
  soysrc ${invalid_file} 2>/dev/null
  assertNotEquals $? 0
}

## shunit2

. ${shunit2_file}
