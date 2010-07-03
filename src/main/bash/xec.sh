#!/bin/bash
# Type chmod +x go.sh in this folder to make it executable
# add this to your ~/.bash_profile to make it simpler to call:
# export PATH=.:$PATH

PWD=$(pwd)
PROJECT_NAME=$(basename "$PWD")
ANT_PATH=$(which ant)

function calculate.xecScriptFileName() {
    local RAW_XEC_SCRIPT_FILE=$0
    local LINKED_XEC_SCRIPT_FILE=$(readlink $RAW_XEC_SCRIPT_FILE)
    XEC_SCRIPT_FILE=$LINKED_XEC_SCRIPT_FILE    
    if [ -z "$LINKED_XEC_SCRIPT_FILE" ]; then
        XEC_SCRIPT_FILE=$RAW_XEC_SCRIPT_FILE
    fi
}

function init() {
    calculate.xecScriptFileName
}

init

echo "-----------------------------------------------------------------------------"
echo "Project name   : [$PROJECT_NAME]"
echo "Working in     : $PWD"
echo "xec home       : $(dirname $XEC_SCRIPT_FILE)"
echo "xec version    : 1.0"
echo "Commands       : $@"
echo "-----------------------------------------------------------------------------"
#echo Using ant from [$ANT_PATH] in directory [$PWD] with command [$1]

#ant -f ./build.xml -Dbasedir=$PWD -Dproject.name=$PROJECT_NAME $@

echo "Doing something here ..."

#type man strftime to see full list of date formatting options.
CURRENT_DATE=`date "+%a %d %b %Y"`
CURRENT_TIME=`date "+%H:%M:%S"`
echo -----------------------------------------------------------------------------
echo Build Complete at $CURRENT_TIME on $CURRENT_TIME.
echo -----------------------------------------------------------------------------
echo