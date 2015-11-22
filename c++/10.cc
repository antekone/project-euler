// Project Euler #7 in C++ by antekone
// http://anadoxin.org/blog
//

#include <vector>
#include <iostream>
#include <math.h>

// Sieve of Eratosthenes.

void e_sieve(size_t n) {
    long sum = 0;
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
		if(A[i] && i < 2000000) {
            sum += i;
			++cnt;
		}
	}

    std::cout << "sum is " << sum << "\n";
}

int main() {
	e_sieve(2001105);
	return 0;
}
