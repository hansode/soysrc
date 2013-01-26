# -*-Shell-script-*-
#
# requires:
#   bash
#

## system variables

readonly abs_dirname=$(cd ${BASH_SOURCE[0]%/*} && pwd)
readonly shunit2_file=${abs_dirname}/../../shunit2

## include files

. ${abs_dirname}/../../../soysrc.sh

## group variables

  valid_file=${abs_dirname}/valid.sh.$$
invalid_file=${abs_dirname}/invalid.sh.$$

## group functions
