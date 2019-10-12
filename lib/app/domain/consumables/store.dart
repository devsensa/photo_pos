import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class ConsumablesState {
  final Consumables consumables = Consumables.empty();
  final Optional<Consumable> consumable = Optional.empty();
}

ConsumablesState initialState() {
  return ConsumablesState();
}

class ConsumablesStore extends Store<ConsumablesState> {
  ConsumablesStore(ConsumablesState initialState) : super(initialState);
}

ConsumablesStore createStore() {
  return ConsumablesStore(initialState());
}
