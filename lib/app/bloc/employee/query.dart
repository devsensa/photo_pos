import 'package:photo_pos/app/bloc/store.dart';

import '../query.dart';
import 'store.dart';

class EmployeeQuery extends Query<EmployeeState> {
  EmployeeQuery(Store<EmployeeState> store) : super(store);
}
