import '../store.dart';

class DealsState {}

class DealsStore extends Store<DealsState> {
  DealsStore(DealsState initialState) : super(initialState);
}

DealsState dealsInitialState() {
  return DealsState();
}
