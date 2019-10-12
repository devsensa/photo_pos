import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class PointsOfSaleState {
  final PointsOfSale pointsOfSale = PointsOfSale.empty();
  final Optional<PointOfSale> pointOfSale = Optional.empty();
}

PointsOfSaleState initialState() {
  return PointsOfSaleState();
}

class PointsOfSaleStore extends Store<PointsOfSaleState> {
  PointsOfSaleStore(PointsOfSaleState initialState) : super(initialState);
}

PointsOfSaleStore createStore() {
  return PointsOfSaleStore(initialState());
}
