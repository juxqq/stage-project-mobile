import 'package:flutter/material.dart';
import 'package:mobile_app/controllers/bdd_controller.dart';
import 'package:mobile_app/share/radius_button.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  @override 
  void initState() {
    super.initState();
    BddController controller = new BddController();
    controller.openConnection();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue !", style: TextStyle(
            fontSize:25
          )),
          const SizedBox(height: 50),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur / email",
                  icon: Icon(Icons.mail)
                ),
                validator: (value) {
                  if(value.toString().contains('@') == false) {
                    return "Veuillez rentrer une adresse au format valide.";
                  }
                  
                  return null;
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Mot de passe",
              ),
              obscureText: true,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Veuillez remplir le champ";
                }

                return null;
              }
            )),
            const SizedBox(height: 50),
            RadiusButton("Se connecter", 
                               () { if(_formKey.currentState!.validate()) { Navigator.pushNamed(context, "/main"); } }),
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
    ));
  }
}