import 'package:optional/optional.dart';
import 'package:uuid/uuid.dart';

import 'package:photo_pos/core/api.dart';
import 'package:photo_pos/core/storage_service.dart';

abstract class ShiftsService {
  final StorageService _storageService;

  ShiftsService(this._storageService);

  Optional<Shift> _maybeGetShift(String shiftRef) {
    return _storageService.shiftByRef(shiftRef);
  }

  Future<void> startShift(StartShift action) {
    String currentEmployeeRef = "";
    String currentEmployeePosRef = "";
    Shift.create(
        posRef: currentEmployeePosRef, employeeRef: currentEmployeeRef);
  }

  Future<void> finishShift(FinishShift action) {
    final shift = _maybeGetShift(action.shift);
  }

  Future<void> changeShiftCorrectnessMark(ChangeShiftCorrectnessMark action) {
    final shift = _maybeGetShift(action.shift);
  }
}

class Shift {
  final String ref;
  final String posRef;
  final String employeeRef;
  final DateTime startedOn;

  Shift(this.ref, this.posRef, this.employeeRef, this.startedOn)
      : assert(ref != null),
        assert(posRef != null),
        assert(employeeRef != null),
        assert(employeeRef != null);

  Shift.create({String posRef, String employeeRef})
      : this(Uuid().v4(), posRef, employeeRef, DateTime.now());
}
