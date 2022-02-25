import 'package:http/http.dart' as http;
import 'package:mobile_app/utils/utils.dart';

class AssocService {
  static Future<dynamic> createAssoc(
      name,
      siret,
      president,
      tresorier,
      secretaire,
      nbMembre,
      description,
      mail,
      siteWeb,
      pdp,
      adresse,
      cp,
      ville,
      image) async {
    try {
      final response =
          await http.post(Uri.parse('$uriApi/postAssoc.php'), body: {
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
        "image": image
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
          await http.put(Uri.parse('$uriApi/putAssoc.php?id=$id'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }
    return true;
  }
}
