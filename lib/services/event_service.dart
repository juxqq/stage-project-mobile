import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/models/event.dart';
import 'package:mobile_app/utils/utils.dart';

class EventService {
  static Future<dynamic> createEvent(nom, publicVise, description,
      datePublication, dateReservationMax, dateEvenement, organisateurPrincipal,
      autreOrganisateurs, adresse, cp, ville, image) async {
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

  static Future<dynamic> updateEvent(id, body) async {
    try {
      final response =
      await http.put(Uri.parse('$uri/putEvent.php?id=$id'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }
    return true;
  }

Future<dynamic> getEvent(nom, ville) async {
    var event = [];

    try {
      final response =
      await http.get(Uri.parse('$uri/getEvent.php?nom=$nom&ville=$ville'));

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
