int check(int q, int howMuch, int n, List<int> arr) {
  if(arr.length == 0)
    return n;

  for(int iter = 0; iter <= (howMuch / arr.first) && howMuch > 0; iter++) {
    var value = howMuch - iter * arr.first;
    if(value >= 0) {
      if(value == 0) {
        n = n + 1;
      } else {
        n = check(q + 1, value, n, arr.sublist(1));
      }
    }
  }

  return n;
}

int count2(var howMuch) {
  var arr = [ 1, 2, 5, 10, 20, 50, 100, 200 ].toSet().toList();
  arr.sort();
  return check(0, howMuch, 0, arr.reversed.toList());
}

void main() {
  var n2 = count2(200);
  print("$n2");
}
