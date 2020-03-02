class AccessException implements Exception {
  String errorMessage() {
    return "You cant perform his operation.";
  }
}

class AuthenticationException implements Exception {
  String errorMessage() {
    return "You should authenticate before perform this action";
  }
}
