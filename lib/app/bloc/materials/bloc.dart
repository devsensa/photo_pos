import 'package:photo_pos/app/bloc/materials/store.dart';
import 'package:photo_pos/app/bloc/store.dart';

import '../service.dart';

class MaterialsBloc extends Service<MaterialsState> {
  MaterialsBloc(Store<MaterialsState> store) : super(store);
  void dispose() {}
}
