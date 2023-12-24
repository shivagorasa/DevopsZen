#!/bin/bash

age=25
income=50000
hasJob=true

if [ $age -gt 18 ] && [ $income -gt 30000 ]; then
    echo "You are eligible for a loan due to age and income."
fi

if [ $age -le 18 ] && [ $income -gt 30000 ]; then
    echo "You are not old enough for a loan, but your income qualifies."
fi

if [ $age -gt 18 ] && [ $income -le 30000 ]; then
    echo "You are old enough for a loan, but your income does not qualify."
fi

# Using logical OR (||) for alternate conditions
if [ $age -ge 18 ] && ( [ $income -gt 30000 ] || $hasJob ); then
    echo "You are eligible for a loan based on age and income or having a job."
fi

# Using Nested if statements
if [ $age -gt 18 ]; then
    if [ $income -gt 50000 ]; then
        echo "You are above 18 and have a high income."
    else
        echo "You are above 18, but your income is not high."
    fi
else
    echo "You are not above 18."
fi


## above script uses multiple conditions of if implemented for a loan evaluation scenario
#We can also read input from user using read command so that we can create a user friendly environment or outputs based on user input
# if we need to check for fixed variables we need to change variables inputs in this file!
