class FormRepository {
  String checkEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)+$');

    var isValid = emailRegex.hasMatch(email);

    if (isValid) {
      return email;
    }

    throw Error;
  }

  String checkPassword(String password) {
    if (password.length >= 8) {
      return password;
    }

    throw Error;
  }
}
