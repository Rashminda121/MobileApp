class TPlatformException {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      // Define platform-specific exception error codes here
      default:
        return 'Platform error occurred with code: $code';
    }
  }
}

class TFormatException implements Exception {
  const TFormatException();

  String get message => 'Invalid format. Please check your input.';
}

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

class TFirebaseException {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      // Handle Firebase Exception error codes here
      default:
        return 'Firebase error occurred with code: $code';
    }
  }
}
