#!/bin/sh
PROJECT_NAME=$1
CHECKSTYLE_HOME=$2
echo "Generating treemap (tm3) file to ./target/treemap/$PROJECT_NAME.tm3 using checkstyle and Doernenburg ruby"

SOURCE_DIR=$PWD/src
SOURCE_JAVA_DIR=$PWD/src/main/java
TEST_JAVA_DIR=$PWD/src/test/java
TARGET_DIR=$PWD/target/treemap
TARGET_FILE=$TARGET_DIR/$PROJECT_NAME.mse

CHECKSTYLE_ANT_SCRIPT="$CHECKSTYLE_HOME/ant/checkstyle.xml"

mkdir -p $TARGET_DIR

ANT_CMD="ant -f $CHECKSTYLE_ANT_SCRIPT"
ANT_PROPERTIES="$ANT_PROPERTIES -Dbasedir=$CHECKSTYLE_HOME/ant/"
ANT_PROPERTIES="$ANT_PROPERTIES -Dsrc.dir=$SOURCE_DIR"
ANT_PROPERTIES="$ANT_PROPERTIES -Dsrc.main.java.dir=$SOURCE_JAVA_DIR"
ANT_PROPERTIES="$ANT_PROPERTIES -Dsrc.test.java.dir=$TEST_JAVA_DIR"
ANT_PROPERTIES="$ANT_PROPERTIES -Dtool.dir=$SOURCE_DIR"
ANT_PROPERTIES="$ANT_PROPERTIES -Dcheckstyle.dir=$CHECKSTYLE_HOME"
ANT_PROPERTIES="$ANT_PROPERTIES -Dtarget.reports.checkstyle.dir=$TARGET_DIR"


echo "Executing: ant to generate treemap"


echo $ANT_CMD $ANT_PROPERTIES
$ANT_CMD $ANT_PROPERTIES