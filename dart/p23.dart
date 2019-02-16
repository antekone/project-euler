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
  if(i <= arr[0] * 2) return false;

  for(var x = 0, lenx = arr.length; x < lenx; x++) {
    for(var y = 0, leny = arr.length - x; y < leny; y++) {
      if(arr[x] + arr[y] == i)
        return true;

      if(arr[x] + arr[y] > i) break;
    }

    if(arr[x] + arr[0] >= i) break;
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

  for(var i = 1; i < 28130; i++) {
    if(!yes(i, abundants))
      sum += i;
  }

  print(sum);
}
