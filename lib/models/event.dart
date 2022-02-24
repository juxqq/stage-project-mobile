import 'package:flutter/material.dart';
import 'package:mobile_app/utils/utils.dart';

class Event {
  final String nom;
  final String publicVise;
  final String description;
  final DateTime datePublication;
  final DateTime dateReservationMax;
  final DateTime dateEvenement;
  final String orgPrinicp;
  final String orgSecond;
  final String loc;
  final String imageName;

  get image {
    return NetworkImage('$uriApi/images/$imageName');
  }

  Event(
      this.nom,
      this.publicVise,
      this.description,
      this.datePublication,
      this.dateReservationMax,
      this.dateEvenement,
      this.orgPrinicp,
      this.orgSecond,
      this.loc,
      this.imageName);

  Event.fromJson(Map<String, dynamic> json)
      : nom = json['nom'],
        publicVise = json['publicVise'],
        description = json['description'],
        datePublication = DateTime.parse(json['datePublication']),
        dateReservationMax = DateTime.parse(json['dateReservationMax']),
        dateEvenement = DateTime.parse(json['dateReservationMax']),
        orgPrinicp = json['organisateurPrincipal'],
        orgSecond = json['autreOrganisateurs'],
        loc = json['localisation'],
        imageName = json['image'];
}
