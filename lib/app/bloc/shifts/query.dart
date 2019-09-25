import '../store.dart';
import 'store.dart';

import '../query.dart';

class ShiftsQuery extends Query<ShiftsState> {
  ShiftsQuery(Store<ShiftsState> store) : super(store);
}
