import 'package:rxdart/rxdart.dart';

typedef T UpdateStateCallback<T>(T prev);

abstract class Store<T> {
  final BehaviorSubject<T> _state;
  T initialState;
  Store(this.initialState) : _state = BehaviorSubject.seeded(initialState);

  T get state => _state.value;
  Observable<T> get stateObservable => _state.stream;

  Observable<R> select<R>(R convert(T state)) {
    return _state.map(convert);
  }

  void update(UpdateStateCallback<T> callback) {
    var newState = callback(state);
    _state.value = newState;
  }

  void dispose() {
    _state.close();
  }
}
