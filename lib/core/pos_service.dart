import 'package:photo_pos/core/api.dart';

import 'storage_service.dart';
import 'data.dart';

class AccessException implements Exception {
  String errorMessage() {
    return "You cant perform his operation.";
  }
}

class AuthenticationException implements Exception {
  String errorMessage() {
    return "You should authenticate before perform this action";
  }
}

class UnknownPointOfSaleException implements Exception {
  String errorMessage() {
    return "Can't find point of sale by ref.";
  }
}

abstract class PosService {
  final StorageService _storage;

  PosService(this._storage);

  PointOfSale _maybeGetPos(String posRef) {
    final maybeCurrentEmployee = _storage.activeEmployee;
    if (!maybeCurrentEmployee.isPresent) {
      throw AuthenticationException();
    }
    final currentEmployee = maybeCurrentEmployee.value;
    if (currentEmployee.isNotManager) {
      throw AccessException();
    }
    final maybePos = _storage.posByRef(posRef);
    if (!maybePos.isPresent) {
      throw UnknownPointOfSaleException();
    }
    return maybePos.value;
  }

  Future<void> addPos(AddPos action) async {
    final newPos = PointOfSale.create(action.title);
    await _storage.savePos(newPos);
  }

  Future<void> closePos(ClosePos action) async {
    final pos = _maybeGetPos(action.posRef);
    await _storage.removePos(pos);
  }

  Future<void> changePosTitle(ChangePosTitle action) async {
    final pos = _maybeGetPos(action.posRef);
    final updatedPos = pos.copyWith(title: action.title);
    await _storage.savePos(updatedPos);
  }

  Future<void> changePosAddress(ChangePosAddress action) async {
    final pos = _maybeGetPos(action.posRef);
    final updatedPos = pos.copyWith(title: action.address);
    await _storage.savePos(updatedPos);
  }
}
