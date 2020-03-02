import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:money/money.dart';

part 'data.g.dart';

@HiveType(typeId: 1)
class Employee {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String passwordHash;
  @HiveField(3)
  final EmployeeRole role;
  @HiveField(4)
  final String firstName;
  @HiveField(5)
  final String lastName;
  @HiveField(6)
  final Money hourlyRate;
  @HiveField(7)
  final double commission;

  Employee(this.ref, this.email, this.passwordHash, this.role, this.firstName,
      this.lastName, this.hourlyRate, this.commission);

  Employee.create(String email, String passwordHash, String firstName)
      : this(Uuid().v4(), email, passwordHash, EmployeeRole.worker, firstName,
            "", Money(0, Currency("USD")), 0.0);

  bool get isManager {
    switch (role) {
      case EmployeeRole.worker:
        return false;
      case EmployeeRole.manager:
        return true;
      default:
        return false;
    }
  }

  bool get isNotManager => !isManager;

  Employee copyWith(
      {String email,
      String passwordHash,
      String firstName,
      String lastName,
      String hourlyRate,
      String commission,
      EmployeeRole role}) {
    final _email = email ?? this.email;
    final _passwordHash = passwordHash ?? this.passwordHash;
    final _firstName = firstName ?? this.firstName;
    final _lastName = lastName ?? this.lastName;
    final _hourlyRate = hourlyRate ?? this.hourlyRate;
    final _commission = commission ?? this.commission;
    final _role = role ?? this.role;
    return Employee(ref, _email, _passwordHash, _role, _firstName, _lastName,
        _hourlyRate, _commission);
  }
}

@HiveType(typeId: 2)
enum EmployeeRole {
  @HiveField(0)
  worker,
  @HiveField(1)
  manager,
}

// ---------------------------- PointOfSale ----------------------------------//

const defaultPosAddress = "";

@HiveType(typeId: 3)
class PointOfSale {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String address;

  PointOfSale(this.ref, this.title, this.address);

  PointOfSale.create(String title)
      : this(Uuid().v4(), title, defaultPosAddress);

  PointOfSale copyWith({String title, String address}) {
    final _title = title ?? this.title;
    final _address = address ?? this.address;
    return PointOfSale(ref, _title, _address);
  }
}

// ------------------------------ Operation ----------------------------------//
const defaultResource = "none";

@HiveType(typeId: 4)
class Operation {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String resource;
  @HiveField(3)
  final Money price;

  Operation(this.ref, this.title, this.resource, this.price);

  Operation.create(String title)
      : this(Uuid().v4(), title, defaultResource, Money(0, Currency("USD")));

  Operation copyWith({String title, String resource, Money price}) {
    final _title = title ?? this.title;
    final _resource = resource ?? this.resource;
    final _price = price ?? this.price;
    return Operation(ref, _title, _resource, _price);
  }
}

@HiveType(typeId: 5)
class OperationExecution {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final String operationRef;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String resource;
  @HiveField(4)
  final String price;
  @HiveField(5)
  final int executedOn;
  @HiveField(6)
  final String executedBy;
  @HiveField(7)
  final String executedAt;

  OperationExecution(this.ref, this.operationRef, this.title, this.resource,
      this.price, this.executedOn, this.executedBy, this.executedAt);

  OperationExecution.fromOperation(
      Operation op, String executorRef, String posRef)
      : ref = Uuid().v4(),
        operationRef = op.ref,
        title = op.title,
        resource = op.resource,
        price = op.price.amountAsString,
        executedOn = DateTime.now().millisecondsSinceEpoch,
        executedBy = executorRef,
        executedAt = posRef;
}
