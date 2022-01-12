import 'package:flutter/material.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/share/radius_button.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Votre profil", style: TextStyle(fontSize: 40)),
          //A modifier avec la requère SQL adapté
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "Nom"
              ),
            ),
          ),
          //A modifier avec la requère SQL adapté
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "prenom"
              ),
            ),
          ),
          //A modifier avec la requère SQL adapté
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "mail"
              ),
            ),
          ),
          //A modifier avec la requère SQL adapté
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "télephone"
              ),
            ),
          ),
          const SizedBox(height: 70),
          RadiusButton("Confirmer les modifications", () {Navigator.pushNamed(context, "/main");}),
        ],
      ),
      bottomNavigationBar: const AppBarWidget()
    );
  }
}
