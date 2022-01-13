import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:http/http.dart' as http;
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

class UserService {
  static const String uri = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> getUser(param, value) async {
    try {
        final response = await http
          .get(Uri.parse('$uri/login.php?$param=$value'));

          if(response.statusCode == 200) {
            var json = jsonDecode(utf8.decode(response.bodyBytes));
 
            if(json.length > 0) {
              return json;
            }
          }
    }
    catch(e) {
      rethrow;
    }
  }

  static Future<dynamic> updateUser(id, password, name, firstName, phone, mail) async {
    try {
      final response = await http.put(Uri.parse('$uri/put.php?id=$id'), body: {
        "name": name,
        "firstName":firstName,
        "phone":phone,
        "mail":mail,
        "password":password
      });

      if(response.statusCode == 200) {
        return true;
      }
    }
    finally {

    }
  }

  Future<dynamic> postUser(password, name, firstName, phone, mail) async {
    User? user;

    try {
      final response = await http.post(Uri.parse('$uri/post.php'), body: {
          "name": "$name",
          "firstName":"$firstName",
          "phone":"$phone",
          "mail":"$mail",
          "password":"$password"
      });

      if(response.statusCode == 200) {
        return true;
      }
    }
    catch(e) {
      rethrow;
    }

    return user;
  }


  static setToken(String token, String refreshToken, User? user) async {
    _AuthData data = _AuthData(token, refreshToken);
    await session.set('tokens', data);
    await session.set('user', user);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await session.get('tokens');
  }

  static Future<dynamic> getUserId() async {
    return await session.get('user');
  }

  static removeToken()async {
    await session.prefs.clear();
  }
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