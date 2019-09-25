import 'package:photo_pos/app/bloc/store.dart';

import '../service.dart';
import 'store.dart';

class ProfileBloc extends Service<ProfileState> {
  ProfileBloc(Store<ProfileState> store) : super(store);

  void dispose() {}
}
