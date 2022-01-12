import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:crypto/crypto.dart';

class UserController {
    final UserService userService = UserService();

    Future<bool> connect(login, password) async {
      User user = await userService.getUser(login);

      var hash = sha512.convert(utf8.encode(password)).toString().toUpperCase();

      if(user == null || user.id == 0 || user.password != hash) {
        return false;
      }

      return true;
    }
}