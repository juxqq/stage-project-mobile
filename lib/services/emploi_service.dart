import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/models/job.dart';
import 'package:mobile_app/utils/utils.dart';

class EmploiService {
  static Future<dynamic> createJob(
      intitule,
      description,
      typeContrat,
      remuneration,
      assoc,
      localisation,
      date,
      dateFin,
      competences,
      niveauEtudes,
      experience,
      secteur) async {
    try {
      final response = await http.post(Uri.parse('$uriApi/postJob.php'), body: {
        "intitule": "$intitule",
        "description": "$description",
        "typeContrat": "$typeContrat",
        "remuneration": "$remuneration",
        "assoc": "$assoc",
        "localisation": "$localisation",
        "date": "$date",
        "dateFin": "$dateFin",
        "competences": "$competences",
        "niveauEtudes": "$niveauEtudes",
        "experience": "$experience",
        "secteur": "$secteur",
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<dynamic> getJob(intitule, localisation) async {
    var jobs = [];

    try {
      final response = await http.get(
          Uri.parse('$uriApi/getJob.php?intitule=$intitule&loc=$localisation'));

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
