import 'dart:math';

int find() {
  var nums = <int>[];
  for(int denom = 10; denom < 99; denom++) {
    for(int nom = 10; nom < denom; nom++) {
      var nomStr = nom.toString();
      var denomStr = denom.toString();

      if(nomStr[1] == denomStr[0]) {
        if(nom/denom == int.parse(nomStr[0]) / int.parse(denomStr[1])) {
          nums += [int.parse(denomStr[1])];
        }
      }
    }
  }

  var product = nums.fold(1, (ret, r) => ret * r) / nums.reduce(max);
  return product.toInt();
}

void main() {
  print(find());
}
