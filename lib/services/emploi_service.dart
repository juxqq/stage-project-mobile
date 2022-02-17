import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';
import 'package:mobile_app/models/job.dart';

class EmploiService {
  static const String uri =
      'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
  static final session = FlutterSession();

  static Future<dynamic> createJob(intitule, description, typeContrat, remuneration, assoc, date, dateFin, datePublication, dateUpdate, competences, niveauEtudes, experience, secteur, adresse, cp, ville) async {
    try {
      final response = await http.post(Uri.parse('$uri/postJob.php'), body: {
        "intitule": "$intitule",
        "description": "$description",
        "typeContrat": "$typeContrat",
        "remuneration":"$remuneration",
        "assoc":"$assoc",
        "date": "$date",
        "dateFin": "$dateFin",
        "datePublication" : "$datePublication",
        "dateUpdate": "$dateUpdate",
        "competences": "$competences",
        "niveauEtudes": "$niveauEtudes",
        "experience": "$experience",
        "secteur": "$secteur",
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

  static Future<dynamic> updateJob(id, body) async {
    try {
      final response =
      await http.put(Uri.parse('$uri/putJob.php?id=$id'), body: body);

      if (response.statusCode != 200) {
        return false;
      }
    } catch (identifier) {
      return false;
    }
    return true;
  }

  Future<dynamic> getJob(intitule, ville, typeContrat, remuneration) async {
    var jobs = [];

    try {
      final response =
      await http.get(Uri.parse('$uri/getJob.php?intitule=$intitule&ville=$ville&typeContrat=$typeContrat&remuneration=$remuneration'));

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));

        if (json.length >= 1) {
          for (var jobJson in json) {
            jobs.add(Job.fromJson(jobJson));
          }
        }
      }
    } catch (identifier) {
      return jobs;
    }

    return jobs;
  }
}
