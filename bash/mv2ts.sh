#!/bin/bash

for file in `find . -type f -name "*.js"`; do
  git mv -- "$file" "${file%.js}.ts"
done
