import 'package:rxdart/rxdart.dart';

import 'store.dart';

abstract class Query<S> {
  final Store<S> _store;
  Query(this._store);

  Observable<S> get state => _store.state$;
  Observable<R> select<R>(R convert(S state)) {
    return _store.state$.map(convert);
  }

  void dispose() {}
}
