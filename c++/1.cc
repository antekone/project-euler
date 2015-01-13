// project euler #1 in Enterprise C++ by antekone
// http://anadoxin.org/blog
//
// usage:
//
// $ g++ 1.cc -o 1 && ./1

#include <iostream>

template <typename T, T ParametrizedValue>
class Modulator {
public:
    T modulo(T input) {
        return input % ParametrizedValue;
    }
};

typedef Modulator<int, 3> Modulator3;
typedef Modulator<int, 5> Modulator5;

template <typename T, T ParametrizedValue>
class Comparator {
public:
    bool compare(T input) {
        return input == ParametrizedValue;
    }
};

typedef Comparator<int, 0> Comparat0r;

int main() {
    Modulator3 by3;
    Modulator5 by5;
    Comparat0r with0;

    size_t sum = 0;
    for(int i = 0; i < 1000; ++i) {
        // Yoda expression
        if(with0.compare(by3.modulo(i)) || with0.compare(by5.modulo(i))) {
            sum += i;
        }
    }

    std::cout << sum << "\n";
}
