import '../store.dart';

class EmployeeState {}

class EmployeeStore extends Store<EmployeeState> {
  EmployeeStore(EmployeeState initialState) : super(initialState);
}

EmployeeState employeeInitialState() {
  return EmployeeState();
}
