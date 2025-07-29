abstract class FormFieldValidators {
  static String? Function(String?) generic({
    required String emptyMessage,
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return emptyMessage;
      }

      return null;
    };
  }

  static String? Function(String?) email({
    required String emptyMessage,
    required String invalidMessage,
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return emptyMessage;
      }

      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value.trim())) {
        return invalidMessage;
      }

      return null;
    };
  }

  static String? Function(String?) password({
    required String emptyMessage,
    required String tooShortMessage,
    int minLength = 6,
  }) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return emptyMessage;
      }

      if (value.length < minLength) {
        return tooShortMessage;
      }

      return null;
    };
  }

  static String? Function(String?) name({
    required String emptyMessage,
    required String tooShortMessage,
    required String invalidMessage,
    int minLength = 2,
  }) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return emptyMessage;
      }

      final trimmedValue = value.trim();

      if (trimmedValue.length < minLength) {
        return tooShortMessage;
      }

      final nameRegex = RegExp(r"^[a-zA-ZÀ-ÿ\s\-']+$");

      if (!nameRegex.hasMatch(trimmedValue)) {
        return invalidMessage;
      }

      return null;
    };
  }
}
