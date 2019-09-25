import 'package:photo_pos/app/bloc/store.dart';

import '../service.dart';
import 'store.dart';

class ShiftsBloc extends Service<ShiftsState> {
  ShiftsBloc(Store<ShiftsState> store) : super(store);

  void dispose() {
    // todo implement function
  }
}
