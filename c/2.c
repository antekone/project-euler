// project euler problem #2
// http://anadoxin.org/blog
//
// $ gcc 2.c -o 2
// $ ./2

#include <stdio.h>

// slow :)
size_t getfib(size_t n) {
	if(n == 0 || n == 1)
		return 1;

	return getfib(n - 1) + getfib(n - 2);
}

int main() {
	size_t f, sum = 0, i = 0;

	do {
		f = getfib(++i);

		if(f % 2 == 0) {
			sum += f;
		}
	} while(f < 4000000);

	printf("%ld\n", sum);
	return 0;
}
