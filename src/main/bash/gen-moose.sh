#!/bin/bash

echo "Generating moose file to ./target/moose/dws.mse using infusion (needs to be in /Applications/inFusion/tools/inFusion)"

SOURCE_DIR=$PWD/src/main/java
TARGET_DIR=$PWD/target/moose
TARGET_FILE=$TARGET_DIR/dws.mse

cd /Applications/inFusion/tools/inFusion

mkdir -p $TARGET_DIR

echo "Executing: java2mse.sh $SOURCE_DIR famix30 $TARGET_FILE"
java2mse.sh $SOURCE_DIR famix30 $TARGET_FILE
