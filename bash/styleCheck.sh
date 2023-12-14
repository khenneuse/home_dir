#!/bin/bash


for file in `cat ~/dev/bash/files.txt`; do
    npx stylelint $file
done
