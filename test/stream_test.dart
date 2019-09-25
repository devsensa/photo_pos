import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  // todo add tests here
  testWidgets("test streams", (WidgetTester tester) async {
    // todo test code here

    var controller = new StreamController<String>.broadcast();
    controller.stream.listen((item) => print("Second listener $item")); // ловушка
    controller.stream.listen((item) => print("First listener $item")); // ловушка
    controller.stream.listen((item) => print("Third listener $item")); // ловушка
    (int min, int max) {
      for (int val = min; val <= max; ++val) {
        controller.add("Item $val");
      }
    }(1, 10);

    controller.close();
  });

  testWidgets("", (WidgetTester tester) async {
    // todo test code here
  });

  test("test stream function equality", () {
    // todo test code here
    var tst = () async* {
      yield 1;
      yield 2;
    };

    Stream<int> s1 = tst();
    Stream<int> s2 = tst();
    expect(false, s1.hashCode == s2.hashCode);
  });
}
