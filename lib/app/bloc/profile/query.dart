import '../store.dart';

import '../query.dart';
import 'store.dart';

class ProfileQuery extends Query<ProfileState> {
  ProfileQuery(Store<ProfileState> store) : super(store);
}
