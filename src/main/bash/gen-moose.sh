#!/bin/bash
PROJECT_NAME=$1
SOURCE_DIR=$PWD/src/main/java
TARGET_DIR=$PWD/target/moose
TARGET_FILE=$TARGET_DIR/$PROJECT_NAME.mse

echo "Generating moose file to ./target/moose/$PROJECT_NAME.mse using infusion (needs to be in /Applications/inFusion/tools/inFusion)"

cd /Applications/inFusion/tools/inFusion

mkdir -p $TARGET_DIR

#Can be famix30 or famix21
echo "Executing: java2mse.sh $SOURCE_DIR famix21 $TARGET_FILE"
java2mse.sh $SOURCE_DIR famix21 $TARGET_FILE
