// ignore_for_file: unnecessary_brace_in_string_interps
import 'dart:convert';
import 'package:mobile_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String uri = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';

  Future<dynamic> getUser(login) async {
    User? user;

    try {
        final response = await http
          .get(Uri.parse('${uri}/login.php?mail=${login}'));

          if(response.statusCode == 200) {
            var json = jsonDecode(utf8.decode(response.bodyBytes));

            if(json.length > 0) {
              user = User.fromJson(json[0]);
            }
          }
    }
    catch(e) {
      rethrow;
    }

    return user;
  }

  Future<dynamic> postUser(password, name, firstName, phone, mail) async {
    User? user;

    try {
      final response = await http.post(Uri.parse('${uri}/post.php'), body: {
          "name": "${name}",
          "firstName":"${firstName}",
          "phone":"${phone}",
          "mail":"${mail}",
          "password":"${password}"
      });
    }
    catch(e) {
      rethrow;
    }

    return user;
  }
}