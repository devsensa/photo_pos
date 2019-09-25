import 'package:uuid/uuid.dart';

class PointOfSale {
  final Uuid id;
  final String slug;
  final String title;
  final String description;
  // todo add location support
  //final location;
  final String adress;

  PointOfSale(this.id, this.slug, this.title, this.description, this.adress);
}
