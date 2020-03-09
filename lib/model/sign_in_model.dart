

class SignInModel {

  final SignInService _signInService;
  Optional<LastSignIn> _lastSignIn;
  
  SignInModel(this._signInService): assert(_signInService != null);
  
  bool get isLastSignInExist => _lastSignIn.isPresent;
  
  bool get isNotLastSignInExist => isLastSignInExist;
  
  Book get isSignIn {
    if (!_lastSignIn.isPresent) return false;
    return _lastSignIn.isSignedIn
  }
  
  void performSignIn(String login, String password) {
    final userRef = _signInService.userRefByLogin(login);
    _signInService.signIn(userRef, password)
  
  }
  
  void refreshSignIn(String password) {
    if (!_lastSignIn.isPresent) {
      throw NotLoginBeforeException();
    }
    
    _signInService.signIn(_lastSignIn.value, password);
  }
}