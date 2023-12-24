#!/bin/bash

read -p "Enter a number: " number

if [ $number -eq 0 ] || [ $number -eq 10 ]; then
    echo "The number is either 0 or 10."
else
    echo "The number is not 0 or 10."
fi

