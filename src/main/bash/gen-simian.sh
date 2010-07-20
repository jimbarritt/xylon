#!/bin/sh



SOURCE_DIR=$PWD/src/main/java
TARGET_DIR=$PWD/target/simian

SIMIAN_HOME=$1

echo "Generating simian duplication report to $TARGET_DIR"

mkdir -p $TARGET_DIR

java -jar $SIMIAN_HOME/simian-2.2.24.jar -reportDuplicateText -formatter=xml:$TARGET_DIR/simian.xml -threshold=6 "$SOURCE_DIR/**/*.java"


echo "Transforming report to $TARGET_DIR/simian.html" 

XALAN_CLASSPATH=$SIMIAN_HOME/xalan.jar:$SIMIAN_HOME/serializer.jar:$SIMIAN_HOME/xercesimpl.jar:$SIMIAN_HOME/xml-apis.jar:xsltc.jar
java -cp $XALAN_CLASSPATH org.apache.xalan.xslt.Process -IN $TARGET_DIR/simian.xml -XSL $SIMIAN_HOME/simian.xsl -OUT $TARGET_DIR/simian.html

open target/simian/simian.html