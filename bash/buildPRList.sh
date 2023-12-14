#!/bin/bash

BASE_URL=`git remote get-url --push origin | sed 's|\.git|/pull/|'`

git log --pretty=format:'%s' --extended-regexp --grep='BUGS-349' | sed "s|.*(#\([0-9]*\))|$BASE_URL\1|"
