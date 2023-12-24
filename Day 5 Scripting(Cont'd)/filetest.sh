#!/bin/bash

filename="example.txt"

if [ -e $filename ] && [ -r $filename ] && [ -w $filename ]; then
    echo "The file exists and is readable and writable."
else
    echo "Either the file does not exist or it lacks read and/or write permissions."
fi

