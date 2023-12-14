#!/bin/bash

# echo "The script you are running has basename $( basename -- "$0"; ), dirname $( dirname -- "$0"; )";
# echo "The present working directory is $( pwd; )";

SCRIPT_DIR=$( dirname -- "$0"; )
modified=()
for file in `cat $SCRIPT_DIR/files.txt`; do
    TS_FILE="${file%.js}.ts"
    git mv -- "$file" "$TS_FILE"
    modified+=($TS_FILE)
    # sed -i 's/exports\./const export /g' $TS_FILE
done

cjs-to-es6 "${modified[@]}"
