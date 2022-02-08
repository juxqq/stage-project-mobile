import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class EmploiService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> createJob(intitule, description, typeContrat, remuneration, assoc, localisation) async {
    try {
      final response = await http.post(Uri.parse('$uri/postJob.php'), body: {
        "intitule": "$intitule",
        "description": "$description",
        "typeContrat": "$typeContrat",
        "remuneration":"$remuneration",
        "assoc":"$assoc",
        "localisation": "$localisation",
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
