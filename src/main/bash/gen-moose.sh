#!/bin/bash
PROJECT_NAME=${1}
SOURCE_DIR=${2}
PROJECT_DIR=${PWD}
TARGET_DIR=${PROJECT_DIR}/target/moose
TARGET_FILE=${TARGET_DIR}/${PROJECT_NAME}.mse

if [ -z "${SOURCE_DIR}" ] ; then
    SOURCE_DIR="src/main/java"
fi

echo "Generating moose file from ${SOURCE_DIR} to ./target/moose/${PROJECT_NAME}.mse using infusion (needs to be in /Applications/inFusion/tools/inFusion)"

mkdir -p ${TARGET_DIR}

#Can be famix30 or famix21
#oldskoool

cd /Applications/inFusion/tools/inFusion

echo "Executing: java2mse.sh ${PWD}/${SOURCE_DIR} famix30 ${TARGET_FILE}"
./java2mse.sh ${PROJECT_DIR}/${SOURCE_DIR} famix21 ${TARGET_FILE}

cd -

#nuskool