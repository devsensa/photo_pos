import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class DealsState {
  final Optional<Deal> deal = Optional.empty();
  final Deals deals = Deals.empty();
}

DealsState initialState() {
  return DealsState();
}

class DealsStore extends Store<DealsState> {
  DealsStore(DealsState initialState) : super(initialState);
}

DealsStore createStore() {
  return DealsStore(initialState());
}
