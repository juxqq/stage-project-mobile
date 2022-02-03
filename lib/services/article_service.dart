import 'package:http/http.dart' as http;
import 'package:mobile_app/utils/utils.dart';

class ArticleService {
  static Future<dynamic> createUser(title, resume, text, published, update, idUser) async {
    try {
      final response =
          await http.post(Uri.parse('$uriApi/postArticle.php'), body: {
            "title": "$title",
            "resume": "$resume",
            "text": "$text",
            "published": "$published",
            "update": "$update",
            "idUser": "$idUser"

          });

      if (response.statusCode != 200) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }
}
