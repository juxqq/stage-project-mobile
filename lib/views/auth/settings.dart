import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/widgets/radius_button.dart';

class AcceuilProfil extends StatefulWidget {
  const AcceuilProfil({Key? key}) : super(key: key);

  String? get title => null;

  @override
  _AcceuilProfilState createState() => _AcceuilProfilState();
}

class _AcceuilProfilState extends State<AcceuilProfil> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const Text("Paramètres", style: TextStyle(fontSize: 40)),
                  const SizedBox(
                    height: 40,
                  ),
                  RadiusButton("Profil", () {
                    Navigator.pushNamed(context, "/profile");
                  }, Colors.black),
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
                    UserService.removeToken();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/main", (Route<dynamic> route) => false);
                  }, Colors.red),
                ],
              ),
            ),
          ),
        ));
  }
}
