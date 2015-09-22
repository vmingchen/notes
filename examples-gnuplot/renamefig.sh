#!/bin/bash - 
#=============================================================================
# Rename figure into CVS repo. 
#
# by Ming Chen, v.mingchen@gmail.com
#=============================================================================

set -o nounset                          # treat unset variables as an error
set -o errexit                          # stop script if command fail
IFS=$' \t\n'                            # reset IFS
unset -f unalias                        # make sure unalias is not a function
\unalias -a                             # unset all aliases
ulimit -H -c 0 --                       # disable core dump
hash -r                                 # clear the command path hash

if [[ $# -ne 2 ]]; then
  echo "usage: $0 oldname newname"
  exit 1
fi

oldname="$1"
newname="$2"

if [[ ! -f ${oldname}.eps ]]; then
  echo "${oldname}.eps does not exist"
  exit 1
fi

function rename() {
  local suffix="$1"
  mv "${oldname}.${suffix}" "${newname}.${suffix}"
}

rename eps
rename dat
rename gp

sed -i "s/${oldname}/${newname}/g" "${newname}.gp"
sed -i "s/^set output.*/set output \"${newname}.eps\"/g" "${newname}.gp"
