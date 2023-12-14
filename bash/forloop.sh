#!/bin/bash

# for file in `git st --porcelain | awk {'print $2'}`; do
#     filename=`basename $file`
#     cp $file $1/$filename
# done

for i in 1 2 3 4 5 6; do
    echo $i
done
