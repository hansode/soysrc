#!/bin/bash
#
# requires:
#  bash
#

SOYSRC_PATH=${SOYSRC_PATH:-".:${HOME}/.soysrc"}

function soysrc() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  local soysrc_file=${file_path}
  local soysrc_path
  local IFS=:

  [[ -a "${soysrc_file}" ]] || {
    for soysrc_path in ${SOYSRC_PATH}; do
      [[ -d "${soysrc_path}"              ]] || continue
      [[ -d "${soysrc_path}/${file_path}" ]] && continue || :
      [[ -a "${soysrc_path}/${file_path}" ]] || continue

      soysrc_file=${soysrc_path}/${file_path}
      break
    done
  }

  [[ -a "${soysrc_file}" ]] || { echo "[ERROR] file not found: ${soysrc_file} or ${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  . ${soysrc_file}
}
