import 'dart:convert';
import 'package:crypto/crypto.dart';

extension ValidatorExtensions on String {
  String? validatePassword() {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (isEmpty || !regex.hasMatch(this)) {
      return 'Au moins 1 majuscule, 1 chiffre, 1 caractère spécial';
    } else {
      return null;
    }
  }

  String hashPass() {
    return sha512.convert(utf8.encode(this)).toString();
  }

  String? validateCode() {
    if (isEmpty || length != 6) {
      return 'Le code doit faire 6 chiffre.';
    }

    return null;
  }

  String? validateEmail() {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);

    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un email valide';
    }

    return null;
  }

  String? validatePhone() {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern);

    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un numéro valide';
    }

    return null;
  }

  String? validateName() {
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(this)) {
      return 'Veuillez entrer un prénom valide';
    }

    return null;
  }

  String? validateLastName() {
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un nom valide';
    }

    return null;
  }
}
