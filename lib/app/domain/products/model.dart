class Products {
  Products.empty();
  final int count = 0;
  final List<Product> products = [];
}

class Product {
  final String title;
  final String price;
  Product(this.title, this.price);
}
