import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  // todo add tests here
  setUpAll(() {
    Hive.init("${Directory.current.path}/data");
  });

//  group("Test open hive boxes", () {
//    test("test open Employee Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox('employee');
//      expect(true, box.isOpen);
//      box.close();
//    });
//
//    test("Test open Materials Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox("materials");
//      expect(true, box.isOpen);
//      box.close();
//    });
//
//    test("Test open Products Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox("products");
//      expect(true, box.isOpen);
//      box.close();
//    });
//
//    test("Test open Points of sales Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox("points_of_sales");
//      expect(true, box.isOpen);
//      box.close();
//    });
//
//    test("Test open Deals Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox("deals");
//      expect(true, box.isOpen);
//      box.close();
//    });
//
//    test("Test open Shifts Hive box", () async {
//      // todo test code here
//      var box = await Hive.openBox("shifts");
//      expect(true, box.isOpen);
//      box.close();
//    });
//  });
//
//  group("Test Hive employee operations", () {
//    Box box;
//    setUp(() async {
//      box = await Hive.openBox("employee");
//    });
//
//    test("Test write employee", () async {
//      // todo test code here
//      //box.put("1", Worker(uid: "1"));
//      expect(false, box.isEmpty);
//      box.clear();
//    });
//  });
}
