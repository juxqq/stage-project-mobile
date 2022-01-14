import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';

class UserController {
  Future<bool> connect(login, String password) async {
    var json = await UserService.getUser("mail", login);

    if (json.length == 0) {
      return false;
    }

    User user = User.fromJson(json[0]);
    var hash = password.hashPass();

    if (user.id == 0 || user.password != hash) {
      return false;
    }

    UserService.setToken(json[0]['token'], json[0]['refreshToken'], user);
    return true;
  }
}
