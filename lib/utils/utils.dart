import 'package:flutter/material.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/share/text_form.dart';

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

List<dynamic> searchJobsWidget(contratController, remunerationController, context) {
  return [
    TextForm(contratController, 'Type de contrat', (value) {}, Icons.hourglass_bottom, false, () {},
        TextInputType.text),
    TextForm(remunerationController, 'Fourchette de rémunération', (value) {}, Icons.attach_money, false, () {},
        TextInputType.text),
    RadiusButton('Rechercher', () {
      Navigator.of(context).pop();
    }, Colors.green)
  ];
}

const String uriApi = 'https://www.dorian-roulet.com/stage_2022_01x02_epsi';