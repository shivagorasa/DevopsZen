#!/bin/bash

number=-1

while [ $number -lt 0 ]; do
    read -p "Enter a positive number: " number

    if [ $number -lt 0 ]; then
        echo "Invalid input. Please enter a positive number."
    fi
done

echo "You entered a valid number: $number"

