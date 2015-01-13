// project euler problem #1 by Grzegorz Antoniak
// http://anadoxin.org/blog
//
// $ gcc 1.c -o 1
// $ ./1

#include <stdio.h>

int main() {
    size_t i, sum = 0;

    for(i = 0; i < 1000; ++i) {
        if(i % 3 == 0 || i % 5 == 0) {
            sum += i;
        }
    }

    printf("sum: %ld\n", sum);
    return 0;
}
