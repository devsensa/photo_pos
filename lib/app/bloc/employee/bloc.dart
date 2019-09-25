import 'package:photo_pos/app/bloc/service.dart';
import 'package:photo_pos/app/bloc/store.dart';

import 'store.dart';

class EmployeeBloc extends Service<EmployeeState> {
  EmployeeBloc(Store<EmployeeState> store) : super(store);

  void dispose() {}
}
