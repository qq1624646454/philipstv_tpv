#!/bin/bash
# Copyright (c) 2016-2100,  jielong_lin,  All rights reserved.
#
JLLPATH="$(which $0)"
# ./xxx.sh
# ~/xxx.sh
# /home/xxx.sh
# xxx.sh
if [ x"${JLLPATH}" != x ]; then
    __CvScriptName=${JLLPATH##*/}
    __CvScriptPath=${JLLPATH%/*}
    if [ x"${__CvScriptPath}" = x ]; then
        __CvScriptPath="$(pwd)"
    else
        __CvScriptPath="$(cd ${__CvScriptPath};pwd)"
    fi
    if [ x"${__CvScriptName}" = x ]; then
        echo
        echo "JLL-Exit:: Not recognize the command \"$0\", then exit - 0"
        echo
        exit 0
    fi 
else
    echo
    echo "JLL-Exit:: Not recognize the command \"$0\", then exit - 1"
    echo
    exit 0
fi
JLLPATH="${__CvScriptPath}"

#
# Setup AutoSync 
#
function Fn_Setup_AutoSync()
{
    crontab -l  > tsk.crontab  2>/dev/null
    if [ -e "${JLLPATH}/._______auto_sync_by_GIT__in_crontab.sh" ]; then
        __chk_if_exist=$(cat tsk.crontab \
                         | grep -E "${JLLPATH}/._______auto_sync_by_GIT__in_crontab.sh")
        if [ x"${__chk_if_exist}" = x ]; then
cat >>tsk.crontab<<EOF

# m  h  dom mon dow command
  30 23 *   *   *   ${JLLPATH}/._______auto_sync_by_GIT__in_crontab.sh

EOF
            crontab tsk.crontab
        fi
        rm -rf tsk.crontab
        echo
        crontab -l 
        echo
    fi

    unset GvTargetLines
}

Fn_Setup_AutoSync

