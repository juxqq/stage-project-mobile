import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';
import 'package:http/http.dart' as http;

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

upload(File imageFile) async {
  // open a bytestream
  var stream = http.ByteStream(DelegatingStream(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse("$uriApi/photos.php");

  // create multipart request
  var request = http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = http.MultipartFile('userfile', stream, length,
      filename: basename(imageFile.path));

  // add file to multipart
  request.files.add(multipartFile);

  // send
  var response = await request.send();

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}

const String uriApi = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
