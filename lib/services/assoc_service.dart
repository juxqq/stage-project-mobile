import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class AssocService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  Future<dynamic> createAssoc(name, siret, president, tresorier, secretaire,
      nbMembre, localisation, description, mail, siteWeb) async {
    try {
      final response = await http.post(Uri.parse('$uri/postAssoc.php'), body: {
        "name": "$name",
        "siret": "$siret",
        "president": "$president",
        "tresorier": "$tresorier",
        "secretaire": "$secretaire",
        "nbMembre": "$nbMembre",
        "localisation": "$localisation",
        "description": "$description",
        "mail": "$mail",
        "siteWeb": "$siteWeb"
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
