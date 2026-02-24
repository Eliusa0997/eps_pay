class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{5,})').hasMatch(password);
  }

  static bool hasMinUserNameLength(String password) {
    return RegExp(r'^(?=.{3,})').hasMatch(password);
  }

  static bool hasSpecialCharacters(String password) {
    return RegExp(r'^(?=.*?[#?!$%@^&*-])').hasMatch(password);
  }
}
