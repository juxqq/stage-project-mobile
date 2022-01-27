import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/radius_button.dart';

class AcceuilProfil extends StatefulWidget {
  const AcceuilProfil({Key? key}) : super(key: key);

  @override
  _AcceuilProfilState createState() => _AcceuilProfilState();

  }

class _AcceuilProfilState extends State<AcceuilProfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: SingleChildScrollView(
          child: Center ( child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 280,
              ),
              const Text("Paramètres", style: TextStyle(fontSize: 40)),
              const SizedBox(
                height: 40,
              ),
              RadiusButton("Profil", () {
                Navigator.pushNamed(context, "/profile");
              },
                  Colors.black),
              const SizedBox(
                height: 40,
              ),
              RadiusButton("Enregistrer une association", () {
                Navigator.pushNamed(context, "/signupAssoc");
              }, Colors.black),
              const SizedBox(
                height: 40,
              ),
              RadiusButton("Se déconnecter", () {
                // Navigator.pushNamed(context, "/reset");
                UserService.removeToken();
                Navigator.pushNamed(context, "/main");
              }, Colors.red),
            ],
          ),
        ),
      ),
    ));
  }
}



