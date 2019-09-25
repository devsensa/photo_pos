import 'package:photo_pos/app/bloc/store.dart';

import '../query.dart';
import 'store.dart';

class DealsQuery extends Query<DealsState> {
  DealsQuery(Store<DealsState> store) : super(store);
}
