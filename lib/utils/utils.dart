import 'package:flutter/material.dart';

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
