import 'store.dart';

class Service<S> {
  final Store<S> _store;

  Service(this._store);

  void update(UpdateStateCallback<S> callback) {
    _store.update(callback);
  }
}
