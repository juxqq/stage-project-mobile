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
      localisation,
      description,
      mail,
      siteWeb,
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
        "localisation": "$localisation",
        "description": "$description",
        "mail": "$mail",
        "siteWeb": "$siteWeb",
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
}
