import 'dart:developer';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

class HiveStore {
  Map<String, Box> _boxes = {};
  String _path;

  HiveStore(this._path) {
    Hive.init(this._path);
  }

  Future<void> initCollections({List<String> collections = const []}) async {
    for (String name in collections) {
      _boxes[name] = await _getOrCreate(name);
    }
  }

  Iterable<String> collections() {
    return _boxes.keys;
  }

  Uint8List read(String collection, dynamic key) {
    Box box = _boxes[collection];
//    fixme add null check
    return box.get(key);
  }

  Future<void> write(String collection, dynamic key, Uint8List data) {
    Box box = _boxes[collection];
//    fixme add null check
    return box.put(key, data);
  }

  Future<void> delete(String collection, dynamic key) {
    Box box = _boxes[collection];
//    fixme add null check
    return box.delete(key);
  }

  Observable<BoxEvent> watchKey(String collection, {dynamic key}) {
    Box box = _boxes[collection];
//    fixme add null check
    return key ? Observable(box.watch(key: key)) : Observable(box.watch());
  }

  int count(String collection) {
    Box box = _boxes[collection];
//    fixme add null check
    return box.length;
  }

  Future<Box> _getOrCreate(String collection) async {
    if (_boxes.containsKey(collection)) {
      return _boxes[collection];
    }
    return await _createBox(collection);
  }

  Future<Box> _createBox(String collection) {
    return Hive.openBox(collection);
  }
}
