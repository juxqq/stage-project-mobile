import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

showSnackBar(context, text, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: color,
  ));
}

List buttons = [
  {"name": "Mon profil", "icon": Icons.assignment_ind},
  {"name": "Enregistrer une association", "icon": Icons.assignment},
  {"name": "Conditions générales", "icon": Icons.rule},
  {"name": "Se déconnecter", "icon": Icons.logout},
];

List<dynamic> searchArticlesWidget(titleController, authorController, context) {
  return [
    TextForm(titleController, 'Titre', (value) {}, Icons.search, false, () {},
        TextInputType.streetAddress),
    TextForm(authorController, 'Auteur', (value) {}, Icons.people, false, () {},
        TextInputType.text),
    RadiusButton('Recherche', () {
      Navigator.of(context).pop();
    }, Colors.green)
  ];
}

upload(File image) async {
  try {
    ///[1] CREATING INSTANCE
    var dioRequest = dio.Dio();
    dioRequest.options.baseUrl = '<YOUR-URL>';

    //[2] ADDING TOKEN
    dioRequest.options.headers = {
      'Authorization': '<IF-YOU-NEED-ADD-TOKEN-HERE>',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    //[3] ADDING EXTRA INFO
    var formData =
        dio.FormData.fromMap({'<SOME-EXTRA-FIELD>': 'username-forexample'});

    //[4] ADD IMAGE TO UPLOAD
    var file = await dio.MultipartFile.fromFile(image.path,
        filename: basename(image.path),
        contentType: MediaType("image", basename(image.path)));

    formData.files.add(MapEntry('userfile', file));

    //[5] SEND TO SERVER
    var response = await dioRequest.post(
      '$uriApi/photos.php',
      data: formData,
    );
    final result = json.decode(response.toString())['result'];
  } catch (err) {
    print('ERROR  $err');
  }
}

const String uriApi = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
