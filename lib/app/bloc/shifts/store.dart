import '../store.dart';

class ShiftsState {}

class ShiftsStore extends Store<ShiftsState> {
  ShiftsStore(ShiftsState initialState) : super(initialState);
}

ShiftsState shiftsInitialState() {
  return ShiftsState();
}
