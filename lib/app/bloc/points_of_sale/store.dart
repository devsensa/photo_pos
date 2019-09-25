import '../store.dart';

class PointsOfSaleState {}

class PointsOfSaleStore extends Store<PointsOfSaleState> {
  PointsOfSaleStore(PointsOfSaleState initialState) : super(initialState);
}

PointsOfSaleState posInitialState() {
  return PointsOfSaleState();
}
