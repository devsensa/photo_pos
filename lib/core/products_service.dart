abstract class ProductsService {

  Future<void> addProduct(AddProduct action) async {}
  
  Future<void> removeProduct(RemoveProduct action) async {}
  
  Future<void> changeProductFavoriteMark(ChangeProductFavoriteMark action) async {}
  
  Future<void> changeProductTitle(ChangeProductTitle action) async {}
  
  Future<void> changeProductAmount(ChangeProductAmount action) async {}
  
  Future<void> changeProductPrice(ChangeProductPrice action) async {}
}
