import 'package:money/money.dart';
import 'package:uuid/uuid.dart';

class Product {
  final Uuid id;
  final DateTime createdOn;
  final String slug;
  final String title;
  final String description;
  final Money price;

  Product(this.id, this.createdOn, this.slug, this.title, this.description, this.price);
}
