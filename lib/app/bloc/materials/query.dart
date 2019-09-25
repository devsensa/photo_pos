import 'package:photo_pos/app/bloc/store.dart';

import '../query.dart';
import 'store.dart';

class MaterialsQuery extends Query<MaterialsState> {
  MaterialsQuery(Store<MaterialsState> store) : super(store);
}
