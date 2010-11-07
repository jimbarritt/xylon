#!/bin/sh

PROJECT_NAME=$1
VIZANT_HOME=$2

TARGET_DIR=$PWD/target/vizant

BUILD_XML=$PWD/build.xml

TARGET_FILE=$TARGET_DIR/$PROJECT_NAME-build.png

echo "Generating vizant (png) file to $TARGET_FILE"

VIZANT_ANT_SCRIPT="$VIZANT_HOME/ant/checkstyle.xml"

mkdir -p $TARGET_DIR

ANT_CMD="ant -f $VIZANT_ANT_SCRIPT"
ANT_PROPERTIES="$ANT_PROPERTIES -Dbasedir=$VIZANT_HOME/ant/"
ANT_PROPERTIES="$ANT_PROPERTIES -Dbuild.xml=$BUILD_XML"

echo "Executing: ant to generate vizualisation of the ant file ..."
echo $ANT_CMD $ANT_PROPERTIES
$ANT_CMD $ANT_PROPERTIES
