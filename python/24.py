#
# project euler #24 solution
#
# euler's method for finding a specific permutation
# python3 24.py  0.02s user 0.00s system 98% cpu 0.023 total
#
# by antekone
#
# http://anadoxin.org/blog
#

import math

def find_quot(max_perm, arr):
    perm_item_cnt = len(arr)
    f = math.factorial(perm_item_cnt - 1)

    for x in range(0, perm_item_cnt):
        r = (1 + x) * f
        if r > max_perm:
            next_max_perm = max_perm - x * f
            return (next_max_perm, x)

    return (f, None)

def find_perm(n, starting_set):
    """n is a permutation index. Smallest number is 1. For n=1, the output
    is the same as the input. Next permutation starts with 2.

    starting_set is a string with items to permutate.
    """

    if n == 0:
        return None

    while True:
        f = math.factorial(len(starting_set))
        if n > f:
            n -= f
        else:
            break

    n -= 1
    max_perm = n
    arr = list(starting_set)
    result = []
    while len(arr) > 0:
        max_perm, quot = find_quot(max_perm, arr)
        if quot is None:
            continue

        result.append(arr[quot])
        del arr[quot]

    return "".join(result)

#print(find_perm(99999999999, '0123456789'))
print(find_perm(1000000, '0123456789'))
