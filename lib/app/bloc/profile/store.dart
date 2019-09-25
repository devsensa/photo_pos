import '../store.dart';

class ProfileState {}

class ProfileStore extends Store<ProfileState> {
  ProfileStore(ProfileState initialState) : super(initialState);
}

ProfileState profileInitialState() {
  return ProfileState();
}
