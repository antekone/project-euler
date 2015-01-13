# project euler #1 in python by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ python3 1.py

sum = 0
for i in range(0, 1000):
    if i % 5 == 0 or i % 3 == 0:
        sum += i

print(sum)
