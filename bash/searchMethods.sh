#!/bin/bash

FILENAME=$1
JUST_FILE=$(basename -- "$FILENAME")
IGNORE_FILE=
TODAY=`date +%+4Y_%m_%d`
OUTFILE=~/dev/bash/output/${JUST_FILE%%.*}_$TODAY.txt
IFS=$'\n' read -d '' -r -a ignoreEntries < ~/dev/bash/input/${JUST_FILE%%.*}_ignore.txt
cd ~/Projects/shipotle-api
for searchTerm in `cat $FILENAME`; do
    # printf "%s\t%s\n" "$searchTerm" "$sum" | tee -a $OUTFILE
    for ignoreEntry in "${ignoreEntries[@]}"; do
    if [ "$ignoreEntry" == "$searchTerm" ]; then
        sum="0"
    else
	sum=`grep -o -r --include='*.ts' "$searchTerm" app/ components/ test/ | wc -l`
    fi
    done

    printf "%s\t%s\n" "$searchTerm" "$sum" | tee -a $OUTFILE
done
