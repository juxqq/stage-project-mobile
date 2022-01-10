import 'package:flutter/material.dart';
import 'package:mobile_app/share/radius_button.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue !", style: TextStyle(
            fontSize:25
          )),
          const SizedBox(height: 50),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Nom d'utilisateur / email"
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
              decoration: InputDecoration(
                labelText: "Mot de passe"
              ),
            )),
            const SizedBox(height: 100),
            RadiusButton("Se connecter", 
                               () { Navigator.pushNamed(context, "/main"); }),
            const SizedBox(height:5),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.centerLeft,
              child : const Text("Vous n'avez pas de compte ?",
                                  style: TextStyle(fontSize: 14))),
            const SizedBox(height: 10),
            RadiusButton("S'inscrire", 
                                () { Navigator.pushNamed(context, "/signup"); })
        ],
      )
    );
  }
}