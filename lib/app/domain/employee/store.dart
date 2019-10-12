import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class EmployeeState {
  final Employee employee = Employee.empty();
  final Optional<Worker> worker = Optional.empty();
}

EmployeeState initialState() {
  return EmployeeState();
}

class EmployeeStore extends Store<EmployeeState> {
  EmployeeStore(EmployeeState initialState) : super(initialState);
}

EmployeeStore createStore() {
  return EmployeeStore(initialState());
}
