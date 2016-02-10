#include <stdio.h>
#include <stdint.h>

int main() {
    uint64_t matrix[21][21];

    for(int y = 0; y < 21; ++y)
        for(int x = 0; x < 21; ++x) {
            if(x == 0 || y == 0)
                matrix[y][x] = 1;
            else
                matrix[y][x] = matrix[y-1][x] + matrix[y][x-1];
        }

    printf("Problem #15: %lld\n", matrix[20][20]);
    return 0;
}
