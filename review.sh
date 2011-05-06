#!/bin/bash - 
#===============================================================================
#
#          FILE:  review.sh
# 
#         USAGE:  ./review.sh 
# 
#   DESCRIPTION:  weekly review notes 
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Ming Chen (chenming), chenming@sogou-inc.com
#       COMPANY: imeresearch@sogou
#       CREATED: 05/01/2011 09:55:10 PM CST
#      REVISION: v0.1, 01/05/11 23:02:23, initial version
#===============================================================================

set -o nounset                          # Treat unset variables as an error
set -o errexit                          # Stop script if command fail
IFS=$' \t\n'                            # Reset IFS
unset -f unalias                        # Make sure unalias is not a function
\unalias -a                             # Unset all aliases

cd ~/notes/
mkdir -p obsolete
oldest_note=`ls [0-9][0-9][0-9][0-9][0-9][0-9].mkd | tr '\t' '\n' | head -n 1`
oldest_date="${oldest_note%.*}"
oldest_year="${oldest_date:0:2}"
oldest_week=`date -d $oldest_date +%V`

beg_sec=`date -d $oldest_date +%s`
notes=""
for (( i = 0; i < 7; i++ )); do
    let sec=$beg_sec+$i*24*3600
    week_no=`date -d "1970-01-01 UTC $sec seconds" +%V`
    if [ "$week_no" = "$oldest_week" ]; then
        dt=`date -d "1970-01-01 UTC $sec seconds" +%y%m%d`
        if [ -f "$dt.mkd" ]; then
            notes="$notes $dt.mkd"
        fi
    fi
done

if [ -n "$notes" ]; then
   ./merge_note.py $notes > "${oldest_year}_${oldest_week}.mkd"
    echo "$notes" | while read note; do
        mv $note obsolete
    done
    vim "${oldest_year}_${oldest_week}.mkd"
fi
