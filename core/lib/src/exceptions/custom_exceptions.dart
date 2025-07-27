sealed class CustomException implements Exception {
  const CustomException({
    required this.message,
  });

  final String message;
}

class CustomAuthException extends CustomException {
  const CustomAuthException({
    required super.message,
    required this.code,
  });

  final AuthApiErrorCode code;
}

class GenericException extends CustomException {
  const GenericException({
    required super.message,
  });
}

class NetworkException extends CustomException {
  const NetworkException({
    required super.message,
  });
}

class NullUserException extends CustomException {
  const NullUserException({
    required super.message,
  });
}

class CacheException extends CustomException {
  const CacheException({
    required super.message,
  });
}

enum AuthApiErrorCode {
  emailNotConfirmed,
  emailAddressInvalid,
  emailExists,
  weakPassword,
  invalidCredentials,
  generic;

  factory AuthApiErrorCode.fromCode(String? code) {
    switch (code) {
      case 'email_not_confirmed':
        return emailNotConfirmed;
      case 'email_address_invalid':
        return emailAddressInvalid;
      case 'email_exists':
        return emailExists;
      case 'weak_password':
        return weakPassword;
      case 'invalid_credentials':
        return invalidCredentials;
      default:
        return generic;
    }
  }
}
