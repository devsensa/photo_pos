import 'package:optional/optional.dart';
import 'package:photo_pos/core/shifts_service.dart';

import 'data.dart';

abstract class StorageService {
  Future<Optional<Employee>> employeeByEmail(String email);
  void setActiveUser(Employee employee);
  void dropActiveUser();
  Optional<Employee> get activeEmployee;
  Optional<Employee> employeeByRef(String employeeRef);
  Future<void> saveEmployee(Employee updatedEmployee);
  Future<void> removeEmployee(employee);

  Future<void> savePos(PointOfSale newPos);
  Future<void> removePos(PointOfSale pos);
  Optional<PointOfSale> posByRef(String posRef);

  Future<void> saveOperation(Operation operation);

  Future<void> removeOperation(Operation operation);

  Optional<Operation> operationByRef(String operationRef);

  Future<void> saveOperationExecution(OperationExecution execution);

  Optional<Shift> shiftByRef(String shiftRef);
}
