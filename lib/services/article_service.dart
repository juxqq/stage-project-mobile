import 'package:http/http.dart' as http;
import 'package:mobile_app/utils/utils.dart';

class ArticleService {
  static Future<dynamic> createUser() async {
    try {
      final response =
          await http.post(Uri.parse('$uriApi/postArticle.php'), body: {});

      if (response.statusCode != 200) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }
}
