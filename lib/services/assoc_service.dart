import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class AssocService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> createAssoc(name, siret, president, tresorier, secretaire,
      nbMembre, description, mail, siteWeb, pdp, adresse, cp, ville) async {
    try {
      final response = await http.post(Uri.parse('$uri/postAssoc.php'), body: {
        "name": "$name",
        "siret": "$siret",
        "president": "$president",
        "tresorier": "$tresorier",
        "secretaire": "$secretaire",
        "nbMembre": "$nbMembre",
        "description": "$description",
        "mail": "$mail",
        "siteWeb": "$siteWeb",
        "pdp": "$pdp",
        "adresse": "$adresse",
        "cp": "$cp",
        "ville": "$ville",
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<dynamic> updateAssoc(id, body) async {
    try {
      final response =
      await http.put(Uri.parse('$uri/putAssoc.php?id=$id'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }
    return true;
  }
}
