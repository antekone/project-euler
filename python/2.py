# project euler #2 in Python, by antekone
# http://anadoxin.org/blog
#
# usage:
#
# $ python 2.py
#

def getfib(n):
    r = 1

    p1 = 1
    p2 = 0

    for i in range(1, n):
        r = p2 + p1
        p2 = p1
        p1 = r

    return r

sum = 0
i = 0
f = 0

while f < 4000000:
    if f % 2 == 0:
        sum += f

    i += 1
    f = getfib(i)

print(sum)
