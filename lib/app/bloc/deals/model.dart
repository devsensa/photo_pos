import 'package:money/money.dart';
import 'package:uuid/uuid.dart';

class Deal {
  final Uuid id;
  final DateTime createdOn;
  final DateTime completedOn;
  final Uuid worker;
  final Money price;
  final List<DealItem> items;

  Deal(this.id, this.createdOn, this.completedOn, this.worker, this.price, this.items);
}

class DealItem {
  final ProductType product;
  final int amount;
  final Money price;

  DealItem(this.product, this.amount, this.price);
}

class ProductType {}
