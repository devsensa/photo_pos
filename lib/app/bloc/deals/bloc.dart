import '../service.dart';
import 'store.dart';

class DealsBloc extends Service<DealsState> {
  DealsBloc(DealsStore store) : super(store);

  void dispose() {}
}
