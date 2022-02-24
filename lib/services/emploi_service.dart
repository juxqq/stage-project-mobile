import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/models/job.dart';
import 'package:mobile_app/utils/utils.dart';

class EmploiService {
  static Future<dynamic> createJob(intitule, description, typeContrat, remuneration, assoc, date, dateFin, datePublication, dateUpdate, competences, niveauEtudes, experience, secteur, adresse, cp, ville) async {
    try {
      final response = await http.post(Uri.parse('$uriApi/postJob.php'), body: {
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
      await http.get(Uri.parse('$uriApi/getJob.php?intitule=$intitule&ville=$ville&typeContrat=$typeContrat&remuneration=$remuneration'));


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
