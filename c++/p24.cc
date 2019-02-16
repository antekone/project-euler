#include <iostream>
#include <algorithm>
#include <vector>

int main() {
    std::vector<int> n { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

    int i = 0;
    do {
        if(++i == 1000000) break;
    } while (std::next_permutation(n.begin(), n.end()));

    for(auto i: n) {
        std::cout << i;
    }

    std::cout << "\n";
    return 0;
}
