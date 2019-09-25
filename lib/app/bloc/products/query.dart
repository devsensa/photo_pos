import '../store.dart';

import 'store.dart';

import '../query.dart';

class ProductsQuery extends Query<ProductsState> {
  ProductsQuery(Store<ProductsState> store) : super(store);
}
