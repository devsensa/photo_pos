import '../store.dart';

class AuthenticationState {}

AuthenticationState initialState() {
  return AuthenticationState();
}

class AuthenticationStore extends Store<AuthenticationState> {
  AuthenticationStore(AuthenticationState initialState) : super(initialState);
}

AuthenticationStore createStore() {
  return AuthenticationStore(initialState());
}
