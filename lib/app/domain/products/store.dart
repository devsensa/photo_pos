import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class ProductsState {
  final Products products = Products.empty();
  final Optional<Product> product = Optional.empty();
}

ProductsState initialState() {
  return ProductsState();
}

class ProductsStore extends Store<ProductsState> {
  ProductsStore(ProductsState initialState) : super(initialState);
}

ProductsStore createStore() {
  return ProductsStore(initialState());
}
