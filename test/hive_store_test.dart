import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:photo_pos/app/services/HiveStore.dart';
import "package:test/test.dart";

var path = '${Directory.current.path}/data';

void main() {
  test("Create HiveStore not failed", () async {
    // todo test code here
    HiveStore store = HiveStore(path);
  });

  test("Should create collections on write", () async {
    // todo test code here
    HiveStore store = HiveStore(path);
    await store.initCollections(collections: ["test1", "test2"]);
    expect(2, store.collections().length);
  });

  test("Should write items", () async {
    // todo test code here
    HiveStore store = HiveStore(path);
    await store.initCollections(collections: ["test1", "test2"]);
    store.write("test1", "test", Uint8List(0));
    store.write("test2", "test", Uint8List(0));
    expect(1, store.count("test1"));
    expect(1, store.count("test2"));
  });

  test("Should read data from hive", () async {
    // todo test code here
    HiveStore store = HiveStore(path);
    await store.initCollections(collections: ["test1", "test2"]);
    store.write("test1", "test", Uint8List(0));
    store.write("test2", "test", Uint8List(0));
    var res1 = store.read("test1", "test");
    var res2 = store.read("test2", "test");
    expect(true, res1 != null);
    expect(true, res2 != null);
  });

  test("Should write items", () async {
    // todo test code here
    HiveStore store = HiveStore(path);
    await store.initCollections(collections: ["test1", "test2"]);
    store.write("test1", "test", Uint8List(0));
    store.write("test2", "test", Uint8List(0));
    expect(1, store.count("test1"));
    expect(1, store.count("test2"));
    store.delete("test1", "test");
    store.delete("test2", "test");
    expect(0, store.count("test1"));
    expect(0, store.count("test2"));
  });
}
