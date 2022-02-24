import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/event.dart';
import 'package:mobile_app/utils/utils.dart';

class EventService {
  static Future<dynamic> createEvent(
      nom,
      publicVise,
      description,
      datePublication,
      dateReservationMax,
      dateEvenement,
      organisateurPrincipal,
      autreOrganisateurs,
      localisation,
      image) async {
    try {
      final response =
          await http.post(Uri.parse('$uriApi/postEvent.php'), body: {
        "nom": "$nom",
        "publicVise": "$publicVise",
        "description": "$description",
        "datePublication": "$datePublication",
        "dateReservationMax": "$dateReservationMax",
        "dateEvenement": "$dateEvenement",
        "organisateurPrincipal": "$organisateurPrincipal",
        "autreOrganisateurs": "$autreOrganisateurs",
        "localisation": "$localisation",
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

  Future<dynamic> getEvent(nom, localisation) async {
    var event = [];

    try {
      final response = await http.get(
          Uri.parse('$uriApi/getEvent.php?intitule=$nom&loc=$localisation'));

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (json.length >= 1) {
          for (var eventJson in json) {
            event.add(Event.fromJson(eventJson));
          }
        }
      }
    } catch (identifier) {
      return event;
    }

    return event;
  }
}
