#!/bin/bash

score=85

if [ $score -ge 90 ]; then
    echo "Excellent!"
elif [ $score -ge 80 ] && [ $score -lt 90 ]; then
    echo "Good job!"
else
    echo "Work harder for a better score."
fi

