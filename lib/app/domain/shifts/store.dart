import 'package:optional/optional.dart';
import 'package:optional/optional.dart' as prefix0;

import '../store.dart';
import 'model.dart';

class ShiftsState {
  final Shifts shifts = Shifts.empty();
  final Optional<Shift> shift = Optional.empty();
  final Optional<ActiveShift> activeShift = Optional.empty();
}

ShiftsState initialState() {
  return ShiftsState();
}

class ShiftsStore extends Store<ShiftsState> {
  ShiftsStore(ShiftsState initialState) : super(initialState);
}

ShiftsStore createStore() {
  return ShiftsStore(initialState());
}
