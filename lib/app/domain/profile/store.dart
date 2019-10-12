import 'package:optional/optional.dart';

import '../store.dart';
import 'model.dart';

class ProfileState {
  final Optional<Profile> profile = Optional.empty();
}

ProfileState initialState() {
  return ProfileState();
}

class ProfileStore extends Store<ProfileState> {
  ProfileStore(ProfileState initialState) : super(initialState);
}

ProfileStore createStore() {
  return ProfileStore(initialState());
}
