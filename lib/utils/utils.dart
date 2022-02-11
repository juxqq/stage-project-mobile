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

const String uriApi = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';
