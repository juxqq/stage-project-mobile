import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:crypto/crypto.dart';

class UserController {
    Future<bool> connect(login, password) async {
      var json = await UserService.getUser("mail", login);

      if(json.length == 0) {
        return false;
      }
      json[0]['id'] = int.parse(json[0]['id']);
      User user = User.fromJson(json[0]); 
      var hash = sha512.convert(utf8.encode(password)).toString();

      if(user.id == 0 || user.password != hash) {
        return false;
      }

      UserService.setToken(json[0]['token'], json[0]['refreshToken'], user);
      return true;
    }
}