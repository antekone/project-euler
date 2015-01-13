#!/bin/bash
#
# project euler #1 in bash by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ bash 1.sh

sum=0

for i in {0..999}; do
    if [ $((i % 5)) == 0 -o $((i % 3)) == 0 ]; then
        let sum=$sum+$i
    fi
done

echo $sum
