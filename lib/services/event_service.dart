import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/models/job.dart';

class EventService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> createEvent(nom, publicVise, description,
      datePublication, dateReservationMax, dateEvenement, organisateurPrincipal,
      autreOrganisateurs, localisation) async {
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

Future<dynamic> getEvent(nom, localisation) async {
    var event = [];

    try {
      final response =
      await http.get(Uri.parse('$uri/getEvent.php?intitule=$nom&loc=$localisation'));

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (json.length >= 1) {
          for (var jobJson in json) {
            event.add(event.fromJson(eventJson));
          }
        }
      }
    } catch (identifier) {
      return event;
    }

    return event;
  }

}
