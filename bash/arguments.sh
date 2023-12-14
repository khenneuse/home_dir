#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Using default"
else
    echo "Using ${@}"
fi
