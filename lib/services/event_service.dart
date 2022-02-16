import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/models/event.dart';

class EventService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> createEvent(nom, publicVise, description,
      datePublication, dateReservationMax, dateEvenement, organisateurPrincipal,
      autreOrganisateurs, adresse, cp, ville) async {
    try {
      final response = await http.post(Uri.parse('$uri/postEvent.php'), body: {
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
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return null;
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
