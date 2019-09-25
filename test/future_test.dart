import 'package:flutter_test/flutter_test.dart';

void main() {
  // todo add tests here
  testWidgets("test throw error in async function", (WidgetTester tester) async {
    // todo test code here
    errorFunc().then((val) {}, onError: (err) {
      expect(true, err is Error);
    });
  });
}

Future<void> errorFunc() async {
  throw Error();
}
