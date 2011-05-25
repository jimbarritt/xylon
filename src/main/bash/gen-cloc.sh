#!/bin/sh

CLOC_DIR=$1
ROOT_DIR=$2

if [ -z "${ROOT_DIR}" ] ; then
    ROOT_DIR="src"
fi

mkdir -p target/metrics/cloc
OUTPUT_FILE="target/metrics/cloc/lines_of_code_per_file_for_${ROOT_DIR}.csv"
rm $OUTPUT_FILE
cloc --csv --by-file-by-lang ${ROOT_DIR} >> ${OUTPUT_FILE}
