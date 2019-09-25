import 'dart:async';

import 'package:optional/optional.dart';
import 'package:photo_pos/app/bloc/service.dart';

import 'store.dart';

enum AuthStatus { NOT_AUTHENTICATED, AUTHENTICATED }

class AuthBloc extends Service<AuthState> {
  AuthBloc(AuthStore store) : super(store);

  Future<void> authenticate() async {
    update((AuthState state) {
      return state.copy(status: AuthStatus.AUTHENTICATED, token: Optional.of(""));
    });
  }

  Future<void> logout() async {
    update((AuthState state) {
      return state.copy(status: AuthStatus.NOT_AUTHENTICATED, token: Optional.empty());
    });
  }
}
