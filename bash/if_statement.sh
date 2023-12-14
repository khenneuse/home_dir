#!/bin/bash

DATE=$1
if [[ $# -ne 1 ]];
then
    echo "Input a date in the format YYYYMMDD"
    read DATE
fi

echo $DATE
