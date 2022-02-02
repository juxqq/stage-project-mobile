import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/utils/utils.dart';

class UserController {
  static void register(password, name, firstName, phone, mail, context) async {
    await UserService.createUser(
            password.hashPass(), name, firstName, phone, mail)
        .then((value) {
      if (value == true) {
        Navigator.pushNamed(context, '/main');
        showSnackBar(
            context,
            'Inscription réussie ! Confirmer votre adresse mail.',
            Colors.green);
      } else {
        showSnackBar(
            context,
            'Inscription impossible ! Un compte utilise déjà cet adresse mail.',
            Colors.red);
      }
    });
  }

  static Future<bool> connect(login, String password) async {
    var json = await UserService.getUser("mail", login);

    if (json['response'] == false) {
      return false;
    }

    User user = User.fromJson(json);
    var hash = password.hashPass();

    if (user.id == 0 || user.password != hash) {
      return false;
    }

    if (json['confirmed'] == '0') {
      return false;
    }

    UserService.setToken(json['token'], json['refreshToken'], user);
    return true;
  }
}
