// Project Euler #7 in C++ by antekone
// http://anadoxin.org/blog
//
// Usage:
//
// $ g++ 7.cc -o 7
// $ ./7 | grep 10001

#include <vector>
#include <iostream>
#include <math.h>

// Sieve of Eratosthenes.

void e_sieve(size_t n) {
	std::vector<bool> A;
	A.resize(n);
	std::fill(A.begin(), A.end(), true);

	size_t sqrtn = sqrt(n);
	for(size_t i = 2; i < sqrtn; ++i) {
		size_t j = i * i;
		if(! A[i])
			continue;

		while(j < n) {
			A[j] = false;
			j += i;
		}
	}

	size_t cnt = 1;
	for(size_t i = 2; i < n; ++i) {
		if(A[i]) {
			std::cout << "idx=" << cnt << " prime=" << i << "\n";
			++cnt;
		}
	}
}

int main() {
	e_sieve(211000);
	return 0;
}
