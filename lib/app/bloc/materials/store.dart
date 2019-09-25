import '../store.dart';

class MaterialsState {}

class MaterialsStore extends Store<MaterialsState> {
  MaterialsStore(MaterialsState initialState) : super(initialState);
}

MaterialsState materialsInitialState() {
  return MaterialsState();
}
