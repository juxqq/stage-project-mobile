import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/share/settings_button.dart';

class AcceuilProfil extends StatefulWidget {
  const AcceuilProfil({Key? key}) : super(key: key);

  String? get title => null;



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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Text("Paramètres", style: TextStyle(fontSize: 40)),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed:() {Navigator.pushNamed(context, "/profile");},
                child: const Text('Profil'),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300,50),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed:() {Navigator.pushNamed(context, "/signupAssoc");},
                child: const Text('Enregistrer une association'),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300,50),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
                ),
              ),
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



