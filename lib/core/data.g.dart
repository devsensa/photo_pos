// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeRoleAdapter extends TypeAdapter<EmployeeRole> {
  @override
  final typeId = 2;

  @override
  EmployeeRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmployeeRole.worker;
      case 1:
        return EmployeeRole.manager;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, EmployeeRole obj) {
    switch (obj) {
      case EmployeeRole.worker:
        writer.writeByte(0);
        break;
      case EmployeeRole.manager:
        writer.writeByte(1);
        break;
    }
  }
}

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final typeId = 1;

  @override
  Employee read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as EmployeeRole,
      fields[4] as String,
      fields[5] as String,
      fields[6] as Money,
      fields[7] as Money,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.passwordHash)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.hourlyRate)
      ..writeByte(7)
      ..write(obj.commission);
  }
}

class PointOfSaleAdapter extends TypeAdapter<PointOfSale> {
  @override
  final typeId = 3;

  @override
  PointOfSale read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PointOfSale(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PointOfSale obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.address);
  }
}

class OperationAdapter extends TypeAdapter<Operation> {
  @override
  final typeId = 4;

  @override
  Operation read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Operation(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as Money,
    );
  }

  @override
  void write(BinaryWriter writer, Operation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.resource)
      ..writeByte(3)
      ..write(obj.price);
  }
}

class OperationExecutionAdapter extends TypeAdapter<OperationExecution> {
  @override
  final typeId = 5;

  @override
  OperationExecution read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OperationExecution(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
      fields[6] as String,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OperationExecution obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.operationRef)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.resource)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.executedOn)
      ..writeByte(6)
      ..write(obj.executedBy)
      ..writeByte(7)
      ..write(obj.executedAt);
  }
}
