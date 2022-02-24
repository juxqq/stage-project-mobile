import 'package:flutter/material.dart';
import 'package:mobile_app/utils/utils.dart';

class Assoc{
  final String name;
  final String siret;
  final String president;
  final String tresorier;
  final String secretaire;
  final int nbMembre;
  final String description;
  final String mail;
  final String siteWeb;
  final String pdpName;
  get pdp{
    return NetworkImage('$uriApi/images/$pdpName');
  }
  final String adresse;
  final String cp;
  final String ville;

  Assoc(this.name, this.siret, this.president, this.tresorier, this.secretaire, this.nbMembre, this.description, this.mail, this.siteWeb, this.pdpName, this.adresse, this.cp, this.ville);

  Assoc.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        siret = json['siret'],
        president = json['president'],
        tresorier = json['tresorier'],
        secretaire = json['secretaire'],
        nbMembre = int.parse(json['nbMembre']),
        description = json['description'],
        mail = json['mail'],
        siteWeb = json['siteWeb'],
        pdpName = json['pdpName'],
        adresse = json['adresse'],
        cp = json['cp'],
        ville = json['ville'];
}