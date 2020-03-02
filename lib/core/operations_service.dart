import 'package:money/money.dart';

import 'api.dart';
import 'storage_service.dart';
import 'data.dart';
import 'exceptions.dart';

class UnknownOperationException implements Exception {
  String errorMessage() {
    return "Can't find operation by ref.";
  }
}

class OperationsService {
  final StorageService _storage;

  OperationsService(this._storage);

  Employee _maybeGetCurrentEmployee() {
    final maybeActiveEmployee = _storage.activeEmployee;
    if (!maybeActiveEmployee.isPresent) {
      throw AuthenticationException();
    }
    return maybeActiveEmployee.value;
  }

  Operation _maybeGetOperation(String operationRef,
      {bool shouldCheckAccess = true}) {
    final currentEmployee = _maybeGetCurrentEmployee();
    if (shouldCheckAccess) {
      if (currentEmployee.isNotManager) {
        throw AccessException();
      }
    }
    final maybeOperation = _storage.operationByRef(operationRef);
    if (!maybeOperation.isPresent) {
      throw UnknownOperationException();
    }
    return maybeOperation.value;
  }

  Future<void> addOperation(AddOperation action) async {
    final operation = Operation.create(action.title);
    await _storage.saveOperation(operation);
  }

  Future<void> removeOperation(RemoveOperation action) async {
    final operation = _maybeGetOperation(action.operationRef);
    await _storage.removeOperation(operation);
  }

  Future<void> changeOperationTitle(ChangeOperationTitle action) async {
    final operation = _maybeGetOperation(action.operationRef);
    final updatedOperation = operation.copyWith(title: action.title);
    await _storage.saveOperation(updatedOperation);
  }

  Future<void> changeOperationResource(ChangeOperationResource action) async {
    final operation = _maybeGetOperation(action.operationRef);
    final updatedOperation = operation.copyWith(title: action.resource);
    await _storage.saveOperation(updatedOperation);
  }

  Future<void> changeOperationPrice(ChangeOperationPrice action) async {
    final operation = _maybeGetOperation(action.operationRef);
    final newPrice = Money.fromString(action.price, Currency("USD"));
    final updatedOperation = operation.copyWith(price: newPrice);
    await _storage.saveOperation(updatedOperation);
  }

  Future<void> executeOperation(ExecuteOperation action) async {
    final employee = _maybeGetCurrentEmployee();
    final operation =
        _maybeGetOperation(action.operationRef, shouldCheckAccess: false);
    final execution = OperationExecution.fromOperation(
        operation, employee.ref, action.posRef);
    await _storage.saveOperationExecution(execution);
  }
}
