#!/bin/bash
#
# requires:
#  bash
#

SOYSRC_PATH=${SOYSRC_PATH:-".:${HOME}/.soysrc"}

function soysrc() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -a "${file_path}" ]] || {
    local soysrc_path
    local IFS=:

    for soysrc_path in ${SOYSRC_PATH}; do
      [[ -d "${soysrc_path}"              ]] || continue
      [[ -d "${soysrc_path}/${file_path}" ]] && continue || :
      [[ -a "${soysrc_path}/${file_path}" ]] || continue

      file_path=${soysrc_path}/${file_path}
      break
    done
  }

  [[ -a "${file_path}" ]] || { echo "[ERROR] file not found: ${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  . ${file_path}
}
