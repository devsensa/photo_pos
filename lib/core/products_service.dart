import 'package:photo_pos/core/api.dart';

abstract class ProductsService {
  Future<void> addProduct(AddProduct action) {}

  Future<void> removeProduct(RemoveProduct action) {}

  void changeProductFavoriteMark(ChangeProductFavoriteMark action) {}

  void changeProductTitle(ChangeProductTitle action) {}

  void changeProductAmount(ChangeProductAmount action) {}

  void changeProductPrice(ChangeProductPrice action) {}
}
