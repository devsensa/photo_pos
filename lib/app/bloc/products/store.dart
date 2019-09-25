import '../store.dart';

class ProductsState {}

class ProductsStore extends Store<ProductsState> {
  ProductsStore(ProductsState initialState) : super(initialState);
}

ProductsState productsInitialState() {
  return ProductsState();
}
