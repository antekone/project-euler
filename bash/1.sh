#!/bin/bash

sum=0

for i in {0..999}; do
    if [ $((i % 5)) == 0 -o $((i % 3)) == 0 ]; then
        let sum=$sum+$i
    fi
done

echo $sum
