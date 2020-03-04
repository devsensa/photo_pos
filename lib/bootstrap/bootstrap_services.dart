import 'package:get_it/get_it.dart';

import '../services/services.dart';

void bootstrapServices(GetIt sl) {
  sl.registerSingleton<NavigationService>(NavigationService());
}
