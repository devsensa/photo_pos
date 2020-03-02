import 'package:flutter_test/flutter_test.dart';

void main() {
  // todo add tests here
  testWidgets("test throw error in async function", (tester) async {
    // todo test code here
    await errorFunc().then((val) {}, onError: () {});
  });
}

Future<void> errorFunc() async {
  throw Error();
}
