#!/bin/bash

read -p "Enter your age: " age;
read -p "Enter your income: " income;

if [ $age -ge 18 ] && [ $income -ge 30000 ]; then
    echo "You meet the criteria."
else
    echo "You do not meet the criteria."
fi

