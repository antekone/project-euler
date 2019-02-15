import 'dart:core';

Iterable<int> divisors(n) sync* {
  yield 1;
  for(int i = 2; i <= (n / 2); i++) {
    if(n % i == 0) {
      yield i;
    }
  }
}

int d(n) => divisors(n).fold(0, (a, b) => a + b);

void main() {
  var sum = 0;
  for(int a = 1; a < 10000; a++) {
    var b = d(a);
    if(d(b) == a && a != b) {
      sum += a;
    }
  }

  print("$sum");
}
