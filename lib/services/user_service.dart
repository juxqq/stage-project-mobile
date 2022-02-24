import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

class UserService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> getUser(param, value) async {
    var json = <String, dynamic>{'response': false};

    try {
      final response =
          await http.get(Uri.parse('$uri/login.php?$param=$value'));

      if (response.statusCode == 200) {
        json = jsonDecode(utf8.decode(response.bodyBytes))[0];

        if (json.length > 1) {
          json['id'] = int.parse(json['id']);
          json['response'] = true;
          return json;
        }
      }
    } catch (identifier) {
      return json;
    }
  }

  static Future<dynamic> updateUser(id, body) async {
    try {
      final response =
          await http.put(Uri.parse('$uri/put.php?id=$id'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }

    return true;
  }

  static Future<dynamic> createUser(
      password, name, firstName, phone, mail, image) async {
    try {
      await getUser("mail", mail).then((value) {
        if (value['response'] == true) {
          return false;
        }
      });
    } catch (e) {
      return false;
    }

    try {
      final response = await http.post(Uri.parse('$uri/post.php'), body: {
        "name": "$name",
        "firstName": "$firstName",
        "phone": "$phone",
        "mail": "$mail",
        "password": "$password",
        "image": image
      });

      await http.post(Uri.parse(
          '$uri/checkMail.php?mail=$mail')); // requete d'envoie mail confirmation

      if (response.statusCode != 200) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  static Future<dynamic> resetPassword(login) async {
    var json = <String, dynamic>{'response': false};
    var data = await getUser("mail", login);

    if (data['response'] == false) {
      return json;
    }

    User user = User.fromJson(data[0]);

    try {
      final response = await http.get(Uri.parse('$uri/mail.php?mail=$login'));

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (json['code'].toString().length == 4) {
          return {
            'id': user.id,
            'name': user.name,
            'firstName': user.firstName,
            'phoneNumber': user.phone,
            'mail': user.mail,
            'password': user.password,
            'image': user.imageName,
            'code': json['code'],
            'response': true
          };
        }
      }
    } catch (exception) {
      return json;
    }
  }

  static setToken(String token, String refreshToken, User? user) async {
    _AuthData data = _AuthData(token, refreshToken);
    await session.set('tokens', data);
    await session.set('user', user);
  }

  static Future<Map<String, dynamic>> getToken() async =>
      await session.get('tokens');

  static Future<dynamic> getUserId() async => await session.get('user');

  static removeToken() async => await session.prefs.clear();
}

class _AuthData {
  String token, refreshToken;
  _AuthData(this.token, this.refreshToken);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
