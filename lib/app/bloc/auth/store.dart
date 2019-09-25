import 'package:optional/optional.dart';
import 'package:photo_pos/app/bloc/auth/bloc.dart';

import '../store.dart';

class AuthState {
  final Optional<String> token;

  AuthState({this.token});

  AuthState copy({Optional<String> token, AuthStatus status}) {
    return AuthState(token: token ?? this.token);
  }
}

class AuthStore extends Store<AuthState> {
  AuthStore(AuthState initialState) : super(initialState);
}

AuthState authInitialState() {
  return AuthState(token: Optional.empty());
}
