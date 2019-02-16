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
bool abundant(n) => d(n) > n;

bool yes(i, arr) {
  for(var x = 0; x < arr.length; x++) {
    for(var y = 0; y < arr.length; y++) {
      if(arr[x] + arr[y] == i)
        return true;

      if(arr[y] - arr[x] >= i) break;
    }

    if(arr[x] >= i) break;
  }

  return false;
}

void main() {
  var sum = 0;

  var abundants = [];
  for(var i = 1; i <= 28123; i++) {
    if(abundant(i))
      abundants.add(i);
  }

  for(var i = 1; i < 28123; i++) {
    if(!yes(i, abundants))
      sum += i;
  }

  print(sum);
}
