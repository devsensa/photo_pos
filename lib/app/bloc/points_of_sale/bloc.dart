import 'package:photo_pos/app/bloc/store.dart';

import '../service.dart';
import 'store.dart';

class PointsOfSaleBloc extends Service<PointsOfSaleState> {
  PointsOfSaleBloc(Store<PointsOfSaleState> store) : super(store);

  void dispose() {
    // todo implement function
  }
}
