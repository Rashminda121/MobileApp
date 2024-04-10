class TFirebaseAuthException {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      // Handle other Firebase Auth error codes here
      default:
        return 'Firebase authentication failed with error code: $code';
    }
  }
}
