import 'package:photo_pos/app/bloc/store.dart';

import '../query.dart';
import 'store.dart';

class AuthQuery extends Query<AuthState> {
  AuthQuery(Store<AuthState> store) : super(store);
}
