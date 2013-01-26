#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

##

function test_no_opts() {
  soysrc 2>/dev/null
  assertNotEquals $? 0
}

## shunit2

. ${shunit2_file}
