import "package:dbcrypt/dbcrypt.dart";

import 'api.dart';
import 'data.dart';
import 'storage_service.dart';

class UnknownEmployeeException implements Exception {
  String errorMessage() {
    return 'No user with provided email';
  }
}

class InvalidPasswordException implements Exception {
  String errorMessage() {
    return 'Invalid password';
  }
}

class ForbiddenOperationException implements Exception {
  String errorMessage() {
    return 'You cant change another employee.';
  }
}

abstract class EmployeeService {
  final StorageService storage;

  EmployeeService(this.storage);

  Employee _maybeGetEmployee(String employeeRef) {
    final currentEmployee = _maybeCurrentEmployee();
    if (currentEmployee.isNotManager && currentEmployee.ref != employeeRef) {
      throw ForbiddenOperationException();
    }
    final maybeEmployee = storage.employeeByRef(employeeRef);
    if (!maybeEmployee.isPresent) {
      throw UnknownEmployeeException();
    }
    return maybeEmployee.value;
  }

  Employee _maybeCurrentEmployee() {
    final maybeCurrentEmployee = storage.activeEmployee;
    if (!maybeCurrentEmployee.isPresent) {
      throw ForbiddenOperationException();
    }
    return maybeCurrentEmployee.value;
  }

  EmployeeRole _roleByName(String roleName, EmployeeRole defaultRole) {
    switch (roleName) {
      case "worker":
        return EmployeeRole.worker;
      case "manager":
        return EmployeeRole.manager;
      default:
        return defaultRole;
    }
  }

  Future<void> signIn(SignIn action) async {
    final employee = await storage.employeeByEmail(action.email);
    employee.ifPresent((employee) {
      final isValidPassword =
          DBCrypt().checkpw(action.password, employee.passwordHash);
      if (!isValidPassword) {
        throw InvalidPasswordException();
      }
      storage.setActiveUser(employee);
    }, orElse: () {
      throw UnknownEmployeeException();
    });
  }

  Future<void> signOut(SignOut action) async {
    storage.dropActiveUser();
  }

  Future<void> changeEmployeeFirstName(ChangeEmployeeFirstName action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final updatedEmployee = employee.copyWith(firstName: action.firstName);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeeLastName(ChangeEmployeeLastName action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final updatedEmployee = employee.copyWith(lastName: action.lastName);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeeEmail(ChangeEmployeeEmail action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final updatedEmployee = employee.copyWith(email: action.email);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeePassword(ChangeEmployeePassword action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final bcrypt = DBCrypt();
    final passwordHash = bcrypt.hashpw(action.password, bcrypt.gensalt());
    final updatedEmployee = employee.copyWith(email: passwordHash);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeeRole(ChangeEmployeeRole action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    var updatedEmployee =
        employee.copyWith(role: _roleByName(action.role, employee.role));
    storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeeCommission(ChangeEmployeeCommission action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final updatedEmployee = employee.copyWith(commission: action.commission);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> changeEmployeeHourlyRate(ChangeEmployeeHourlyRate action) async {
    final employee = _maybeGetEmployee(action.employeeRef);
    final updatedEmployee = employee.copyWith(hourlyRate: action.hourlyRate);
    await storage.saveEmployee(updatedEmployee);
  }

  Future<void> createEmployee(CreateEmployee action) async {
    final bcrypt = DBCrypt();
    final passwordHash = bcrypt.hashpw(action.password, bcrypt.gensalt());
    final employee =
        Employee.create(action.email, passwordHash, action.firstName);
    storage.saveEmployee(employee);
  }

  Future<void> removeEmployee(RemoveEmployee action) async {
    final currentEmployee = _maybeCurrentEmployee();
    if (currentEmployee.role == EmployeeRole.worker) {
      throw ForbiddenOperationException();
    }
    final employee = storage.employeeByRef(action.employeeRef);
    if (!employee.isPresent) {
      throw UnknownEmployeeException();
    }
    storage.removeEmployee(employee.value);
  }
}
