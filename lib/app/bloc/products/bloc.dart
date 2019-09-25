import 'package:photo_pos/app/bloc/service.dart';
import 'package:photo_pos/app/bloc/store.dart';

import 'store.dart';

class ProductsBloc extends Service<ProductsState> {
  ProductsBloc(Store<ProductsState> store) : super(store);

  void dispose() {}
}
