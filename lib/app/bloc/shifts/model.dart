import 'package:uuid/uuid.dart';

class Shift {
  final Uuid id;
  final DateTime timestamp;
  final Uuid owner;

  Shift(this.id, this.timestamp, this.owner);
}
