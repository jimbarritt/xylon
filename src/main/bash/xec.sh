#!/bin/bash
# Type chmod +x go.sh in this folder to make it executable
# add this to your ~/.bash_profile to make it simpler to call:
# export PATH=.:$PATH

CURRENT_DIR=$(pwd)
PROJECT_NAME=$(basename "$PWD")
ANT_PATH=$(which ant)

function calculate.xecScriptFileName() {
    local RAW_XEC_SCRIPT_FILE=$0
    local LINKED_XEC_SCRIPT_FILE=$(readlink $RAW_XEC_SCRIPT_FILE)
    XEC_SCRIPT_FILE=$LINKED_XEC_SCRIPT_FILE    
    if [ -z "$LINKED_XEC_SCRIPT_FILE" ]; then
        XEC_SCRIPT_FILE=$RAW_XEC_SCRIPT_FILE
    fi
    XEC_HOME=$(dirname $XEC_SCRIPT_FILE)    
}

function init() {
    calculate.xecScriptFileName
}

init

echo "-----------------------------------------------------------------------------"
echo "Project name   : [$PROJECT_NAME]"
echo "Working in     : $CURRENT_DIR"
echo "xec home       : $XEC_HOME"
echo "xec version    : 1.0"
echo "Commands       : $@"
echo "-----------------------------------------------------------------------------"
#echo Using ant from [$ANT_PATH] in directory [$PWD] with command [$1]

#ant -f ./build.xml -Dbasedir=$PWD -Dproject.name=$PROJECT_NAME $@

echo "Initialising java-basic project in $CURRENT_DIR"

rm -r *
cp -r $XEC_HOME/../project-templates/java-basic/* $CURRENT_DIR

mv ./ide/intellij/\${project.name} ./ide/intellij/$PROJECT_NAME
mv ./ide/intellij/$PROJECT_NAME/\${project.name}.iml ./ide/intellij/$PROJECT_NAME/$PROJECT_NAME.iml

eval sed -i .bak "'s/\\\$project\.name\\\$/$PROJECT_NAME/g'" "./ide/intellij/$PROJECT_NAME/.idea/modules.xml"

rm "./ide/intellij/$PROJECT_NAME/.idea/modules.xml.bak" 

open -a /Applications/IntelliJ\ IDEA\ 9.0.1.app/ ide/intellij/$PROJECT_NAME



#type man strftime to see full list of date formatting options.
CURRENT_DATE=$(date "+%a %d %b %Y")
CURRENT_TIME=$(date "+%H:%M:%S")
echo -----------------------------------------------------------------------------
echo Build Complete at $CURRENT_TIME on $CURRENT_TIME.
echo -----------------------------------------------------------------------------
echo