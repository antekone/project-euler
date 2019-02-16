import 'dart:io';
import 'dart:core';
import 'dart:convert';

class Tuple2<A, B> {
  A a;
  B b;

  Tuple2(this.a, this.b);
}

Future<String> names() async =>
  File("p022_names.txt").openRead().transform(utf8.decoder).join();

Stream<Tuple2<String, int>> indexedNames() async* {
  List<String> table = (await names()).split(",").map((s) => s.replaceAll("\"", "")).toList();
  table.sort();
  for(int i = 1; i <= table.length; i++) {
    yield Tuple2(table[i - 1], i);
  }
}

Future<int> search() async {
  return indexedNames().fold(0, (sum, tuple) =>
    sum + (tuple.b * tuple.a.runes.map((ch) => ch - 64).reduce((a, b) => a + b)));
}

void main() {
  search().then((r) => print(r));
}
