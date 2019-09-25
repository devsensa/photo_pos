import 'package:rxdart/rxdart.dart';

import 'store.dart';

abstract class Query<S> {
  final Store<S> _store;
  Query(this._store);

  Observable<S> get state => _store.stateObservable;
  Observable<R> select<R>(R convert(S state)) {
    return _store.stateObservable.map(convert);
  }

  void dispose() {}
}
